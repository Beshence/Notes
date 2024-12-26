import 'package:notes/main.dart';

import 'package:flutter/material.dart';
import 'package:notes/misc.dart';

import '../boxes/notes_box.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({super.key, required this.note});

  @override
  State<StatefulWidget> createState() => _NoteScreenState();
}


class _NoteScreenState extends State<NoteScreen> {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  DateTime titleLastModified = DateTime.timestamp();
  DateTime textLastModified = DateTime.timestamp();

  void saveNote() {
    bool flag = false;
    String? title = titleController.text == "" ? null : titleController.text;
    String? text = textController.text == "" ? null : textController.text;

    if(widget.note.title != title) {
      flag = true;
      widget.note.title = title;
    }
    if(widget.note.text != text) {
      flag = true;
      widget.note.text = text;
    }
    if(flag) {
      widget.note.modifiedAt = DateTime.timestamp();
      notesBox.updateLocalNote(widget.note);
      notesChangeNotifier.updateNotes();
    }
  }

  @override
  void dispose() {
    saveNote();
    if(widget.note.title == null && widget.note.text == null) {
      notesBox.deleteLocalNote(widget.note);
      notesChangeNotifier.updateNotes();
    }
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    titleController.text = widget.note.title ?? "";
    textController.text = widget.note.text ?? "";

    titleController.addListener(() async {
      DateTime thisTitleLastModified = DateTime.timestamp();
      titleLastModified = thisTitleLastModified;
      await Future.delayed(Duration(seconds: 3), () {
        if(titleLastModified == thisTitleLastModified) {
          saveNote();
        }
      });
    });

    textController.addListener(() async {
      DateTime thisTextLastModified = DateTime.timestamp();
      textLastModified = thisTextLastModified;
      await Future.delayed(Duration(seconds: 3), () {
        if(textLastModified == thisTextLastModified) {
          saveNote();
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false, bottom: false, left: true, right: true,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 3,
              floating: false,
              pinned: !false,
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(fontSize: 24),
                            controller: titleController,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Title",
                              border: InputBorder.none,
                            ),
                          ),
                          TextField(
                            maxLines: null,
                            controller: textController,
                            //style: TextStyle(height: 1.25),
                            decoration: InputDecoration(
                              hintText: "Start writing...",
                              border: InputBorder.none,
                            ),
                            //autofocus: true,
                          )
                        ],
                      ),
                    )
                  ]
                )
            )
          ]
        ),
      )
    );
  }
}

