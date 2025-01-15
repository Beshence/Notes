import 'dart:isolate';

import 'package:beshence_vault/beshence_vault.dart';
import 'package:uuid/uuid.dart';

import '../boxes/history_box_v1.dart';
import '../boxes/notes_box_v1.dart';
import '../boxes/servers_box_v1.dart';
import '../misc.dart';

class ServerIsolate extends IsolateHandler {
  @override
  void main(ReceivePort mainReceivePort, SendPort isolateSendPort) {
    mainReceivePort.listen((message) {
      List<String> args = message.split(".");
      var command = args.removeAt(0);
      switch(command) {
        case "pong":
          isolateSendPort.send("pullOne");
          break;
        case "pulledOne":
          if(args[0] == "new") {
            notesChangeNotifier.updateNotes();
            print("PULLED NEW. PULLING AGAIN NOW");
            isolateSendPort.send("pullOne");
          } else {
            print("DIDN'T PULL ANYTHING. SENDING PUSH ONE");
            isolateSendPort.send("pushOne");
          }
          break;
        case "pushedOne":
          if(args[0] == "new") {
            notesChangeNotifier.updateNotes();
            print("PUSHED ONE. PUSH AGAIN NOW");
            isolateSendPort.send("pushOne");
          } else {
            print("DIDN'T PUSH ANYTHING. SENDING PULL ONE");
            Future.delayed(Duration(seconds: 3), () => isolateSendPort.send("pullOne"));
          }
      }
    });

    isolateSendPort.send("ping");
  }

  @override
  Future<void> isolate(ReceivePort isolateReceivePort, SendPort mainSendPort) async {
    ServersBoxV1 serversBox = await ServersBoxV1.create();
    NotesBoxV1 notesBox = await NotesBoxV1.create();
    HistoryBoxV1 historyBox = await HistoryBoxV1.create();

    isolateReceivePort.listen((message) async {
      List<String> args = message.split(".");
      var command = args.removeAt(0);
      switch(command) {
        case "ping":
          mainSendPort.send("pong");
          break;
        case "pullOne":
          try {
            ServerV1? localInfoAboutServer = serversBox.getServer();
            if (localInfoAboutServer == null) return;
            String? localLastEventId = localInfoAboutServer.lastEventId;

            BeshenceVault vault = BeshenceVault(
                address: localInfoAboutServer.address,
                token: localInfoAboutServer.token);
            final BeshenceChain chain = vault.getChain("notes");
            final String? serverLastEventId = await chain.lastEventId;


            // 1. first we find out if there's a need to get new event
            if(!(localLastEventId != serverLastEventId && serverLastEventId != null)) {
              mainSendPort.send("pulledOne.noNew");
              return;
            }

            // 1.1. we get the next event's id of already locally processed event
            String eventIdToFetch = localLastEventId != null
                ? (await chain.getEvent(localLastEventId))["next"]
                : (await chain.firstEventId)!;

            // 1.2. we get this event and create history entry out of it
            dynamic event = await chain.getEvent(eventIdToFetch);
            HistoryEntryV1 historyEntry = HistoryEntryV1(
                noteId: event["data"]["note_id"],
                type: event["type"],
                noteTitle: event["data"]["title"],
                noteText: event["data"]["text"],
                noteCreatedAt: event["data"]["created_at"] != null ? DateTime.fromMillisecondsSinceEpoch(event["data"]["created_at"]) : null,
                noteModifiedAt: DateTime.fromMillisecondsSinceEpoch(event["data"]["modified_at"]),
                chainEventId: eventIdToFetch,
                applied: false
            );

            // 1.3. then we add entry to our history
            historyBox.addEntry(historyEntry);

            // 1.4. and we update info
            localLastEventId = eventIdToFetch;
            localInfoAboutServer.lastEventId = localLastEventId;
            serversBox.setServer(localInfoAboutServer);

            // 2. we apply this history entry to our notes
            if(historyEntry.type == "create_note") {
              if(notesBox.getNote(historyEntry.noteId) == null) {
                // create new note
                NoteV1 newNote = NoteV1(
                    id: historyEntry.noteId,
                    createdAt: historyEntry.noteCreatedAt!,
                    modifiedAt: historyEntry.noteModifiedAt,
                    title: historyEntry.noteTitle,
                    text: historyEntry.noteText
                );
                notesBox.addNote(newNote);
              }
            } else if(historyEntry.type == "update_note") {
              NoteV1? note = notesBox.getNote(historyEntry.noteId);
              if(note != null) {
                // check if local note update event is newer than note's modifiedAt
                if(note.modifiedAt.isAfter(historyEntry.noteModifiedAt)) {
                  List<HistoryEntryV1> noteHistoryEntries = historyBox.getEntriesOf(
                      note.id);

                  for (HistoryEntryV1 noteHistoryEntry in noteHistoryEntries) {
                    // recreate event from the start
                    if (noteHistoryEntry.type == "create_note") {
                      note.modifiedAt = noteHistoryEntry.noteModifiedAt;
                    }
                    else if (noteHistoryEntry.type == "update_note") {
                      if (noteHistoryEntry.noteTitle != null) note.title = noteHistoryEntry.noteTitle;
                      if (noteHistoryEntry.noteText != null) note.text = noteHistoryEntry.noteText;
                      note.modifiedAt = noteHistoryEntry.noteModifiedAt;
                    }
                    else if (noteHistoryEntry.type == "delete_note") {
                      note.modifiedAt = noteHistoryEntry.noteModifiedAt;
                      note.deleted = true;
                    }
                  }
                } else {
                  if(historyEntry.noteTitle != null) note.title = historyEntry.noteTitle;
                  if(historyEntry.noteText != null) note.text = historyEntry.noteText;
                  note.modifiedAt = historyEntry.noteModifiedAt;
                }
                notesBox.updateNote(note);
              }
            } else if(historyEntry.type == "delete_note") {
              NoteV1 note = notesBox.getNote(historyEntry.noteId)!;
              if(!note.deleted) notesBox.updateNote(note..deleted = true);
            }
            historyBox.setEntryAppliedToTrue(historyEntry);

            mainSendPort.send("pulledOne.new");
          } on BeshenceVaultException catch(e) {
            print("error while pulling:");
            print(e.httpCode);
            print(e.name);
            print(e.description);
            mainSendPort.send("pulledOne.error");
          }
          break;
        case "pushOne":
          try {
            HistoryEntryV1? entryToUpload = historyBox.getFirstNotUploadedEntry();
            if(entryToUpload == null) {
              mainSendPort.send("pushedOne.noNew");
              return;
            }

            ServerV1? localInfoAboutServer = serversBox.getServer();
            if (localInfoAboutServer == null) return;

            BeshenceVault vault = BeshenceVault(
                address: localInfoAboutServer.address,
                token: localInfoAboutServer.token);
            final BeshenceChain chain = vault.getChain("notes");

            if(entryToUpload.type == "create_note") {
              String eventId = await chain.postEvent({
                "request_id": Uuid().v4(),
                "type": "create_note",
                "v": "v1",
                "data": {
                  "note_id": entryToUpload.noteId,
                  "created_at": entryToUpload.noteCreatedAt!.millisecondsSinceEpoch,
                  "modified_at": entryToUpload.noteModifiedAt.millisecondsSinceEpoch,
                  "title": entryToUpload.noteTitle,
                  "text": entryToUpload.noteText
                },
                if (localInfoAboutServer.lastEventId != null) "prev": localInfoAboutServer.lastEventId
              });
              serversBox.setServer(localInfoAboutServer..lastEventId = eventId);
              historyBox.setEntryEventId(entryToUpload, eventId);
              mainSendPort.send("pushedOne.new");
            } else if(entryToUpload.type == "update_note") {
              String eventId = await chain.postEvent({
                "request_id": Uuid().v4(),
                "type": "update_note",
                "v": "v1",
                "data": {
                  "note_id": entryToUpload.noteId,
                  "modified_at": entryToUpload.noteModifiedAt.millisecondsSinceEpoch,
                  if(entryToUpload.noteTitle != null) "title": entryToUpload.noteTitle,
                  if(entryToUpload.noteText != null) "text": entryToUpload.noteText,
                },
                if (localInfoAboutServer.lastEventId != null) "prev": localInfoAboutServer.lastEventId
              });
              serversBox.setServer(localInfoAboutServer..lastEventId = eventId);
              historyBox.setEntryEventId(entryToUpload, eventId);
              mainSendPort.send("pushedOne.new");
            } else if(entryToUpload.type == "delete_note") {
              String eventId = await chain.postEvent({
                "request_id": Uuid().v4(),
                "type": "delete_note",
                "v": "v1",
                "data": {
                  "note_id": entryToUpload.noteId,
                  "modified_at": entryToUpload.noteModifiedAt.millisecondsSinceEpoch
                },
                if (localInfoAboutServer.lastEventId != null) "prev": localInfoAboutServer.lastEventId
              });
              serversBox.setServer(localInfoAboutServer..lastEventId = eventId);
              historyBox.setEntryEventId(entryToUpload, eventId);
              mainSendPort.send("pushedOne.new");
            }
          } on BeshenceVaultException catch(e) {
            print("error while pushing:");
            print(e.httpCode);
            print(e.name);
            print(e.description);
            mainSendPort.send("pushedOne.error");
          }
          break;
      }
    });
  }
}