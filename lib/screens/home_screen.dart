import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/main.dart';
import 'package:uuid/uuid.dart';

import '../boxes/notes_box.dart';
import '../misc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openNewNote() {
    Note note = Note(id: Uuid().v4(), modifiedAt: DateTime.timestamp(), title: '', text: '');
    notesBox.addLocalNote(note);
    notesChangeNotifier.updateNotes();
    context.go('/note/${note.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beshence Notes"),
        actions: [
          IconButton(onPressed: () => context.go("/settings"), icon: Icon(Icons.account_circle_outlined)),
        ],
      ),
      body: ListenableBuilder(
          listenable: notesChangeNotifier,
          builder: (BuildContext context, Widget? child) {
            List<Note> notes = notesBox.getAllLocalNotes();
            List<Widget> notesWidgets = [];
            for(Note note in notes) {
              notesWidgets.add(
                  Card(
                    color: ElevationOverlay.applySurfaceTint(
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surfaceTint,
                        3),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () => context.go("/note/${note.id}"),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(note.title != null) Text(note.title!, style: TextStyle(fontSize: 18),),
                              if(note.text != null && note.title != null) SizedBox.fromSize(size: Size(0, 12)),
                              if(note.text != null) Text(note.text!, style: TextStyle(fontSize: 14), maxLines: 5, overflow: TextOverflow.fade,)
                            ],
                          )
                      ),
                    ),
                  )
              );
            }
            return Padding(padding: EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 16,children: notesWidgets,));
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewNote,
        tooltip: 'New note',
        isExtended: true,
        enableFeedback: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}