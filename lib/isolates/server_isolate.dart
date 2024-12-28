import 'dart:isolate';

import 'package:beshence_vault/beshence_vault.dart';

import '../boxes/server_notes_box_v1.dart';
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
          isolateSendPort.send("pull");
          break;
      }
    });

    isolateSendPort.send("ping");
  }

  @override
  Future<void> isolate(ReceivePort isolateReceivePort, SendPort mainSendPort) async {
    isolateReceivePort.listen((message) async {
      List<String> args = message.split(".");
      var command = args.removeAt(0);
      switch(command) {
        case "ping":
          mainSendPort.send("pong");
          break;
        case "pull":
          ServersBoxV1 serversBox = await ServersBoxV1.create();
          ServerNotesBoxV1 serverNotesBox = await ServerNotesBoxV1.create();
          ServerV1? localInfoAboutServer = serversBox.getServer();
          if (localInfoAboutServer == null) return;
          final String? localLastEventId = localInfoAboutServer.lastEventId;

          BeshenceVault vault = BeshenceVault(
              address: localInfoAboutServer.address, token: localInfoAboutServer.token);
          final BeshenceChain chain = vault.getChain("notes");
          final String? serverLastEventId = await chain.lastEventId;

          if(serverLastEventId != localLastEventId && serverLastEventId != null) {
            print(serverLastEventId);
            print(localLastEventId);
            Map<String, dynamic> newEvents = {};
            List<String> newEventsIds = [serverLastEventId];

            // fetching all events; serverLastEventId -> localLastEventId
            String? eventIdToFetch = serverLastEventId;
            while(serverLastEventId != localLastEventId && eventIdToFetch != null) {
              print("eventIdToFetch $eventIdToFetch");
              final event = await chain.getEvent(eventIdToFetch);
              newEvents[eventIdToFetch] = event;
              if(event["parent"] != null) newEventsIds.add(event["parent"]);
              eventIdToFetch = event["parent"];
            }

            // we've fetched all events
            // now we're going to update serverNotesBox according to events
            // we go localLastEventId -> serverLastEventId
            newEventsIds = newEventsIds.reversed.toList();
            for(String newEventId in newEventsIds) {
              dynamic newEvent = newEvents[newEventId];
              switch(newEvent["type"]) {
                case "create_note":
                  serverNotesBox.addServerNote(ServerNoteV1(id: newEvent["data"]["note_id"], createdAt: DateTime.fromMillisecondsSinceEpoch(newEvent["data"]["created_at"]*1000), modifiedAt: DateTime.fromMillisecondsSinceEpoch(newEvent["data"]["modified_at"]*1000), title: newEvent["data"]["title"], text: newEvent["data"]["text"]));
                  print("create_note");
                  break;
                case "update_note":
                  var note = serverNotesBox.getServerNote(newEvent["data"]["note_id"]);
                  note.title = newEvent["data"]["title"] ?? note.title;
                  note.text = newEvent["data"]["text"] ?? note.text;
                  note.modifiedAt = newEvent["data"]["modified_at"] != null ? DateTime.fromMillisecondsSinceEpoch(newEvent["data"]["modified_at"]*1000) : note.modifiedAt;
                  serverNotesBox.updateServerNote(note);
                  print("update_note");
                  break;
                case "delete_note":
                  serverNotesBox.deleteServerNote(serverNotesBox.getServerNote(newEvent["data"]["note_id"]));
                  print("delete_note");
                  break;
              }
            }

            // we've updated snapshot of server info
            // now we update server last event id
            localInfoAboutServer.lastEventId = serverLastEventId;
            serversBox.setServer(localInfoAboutServer);
          }
      }
    });
  }
}