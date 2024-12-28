import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/main.dart';

import 'package:flutter/material.dart';
import 'package:notes/misc.dart';

import '../boxes/notes_box_v1.dart';

class NoteScreen extends StatefulWidget {
  final NoteV1 note;
  const NoteScreen({super.key, required this.note});

  @override
  State<StatefulWidget> createState() => _NoteScreenState();
}


class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocusNode = FocusNode();

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
    titleController.dispose();
    textController.dispose();
    textFocusNode.dispose();
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
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          saveNote();
          if(widget.note.title == null && widget.note.text == null) {
            notesBox.deleteLocalNote(widget.note);
            notesChangeNotifier.updateNotes();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch(value) {
                  case "Delete":
                    titleController.text = '';
                    textController.text = '';
                    context.pop();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Delete'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: SafeArea(
          top: false, bottom: false, left: true, right: true,
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(fontSize: 24),
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              controller: titleController,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Title",
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              focusNode: textFocusNode,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              maxLines: null,
                              controller: textController,
                              //style: TextStyle(height: 1.25),
                              decoration: InputDecoration(
                                hintText: "Start writing...",
                                border: InputBorder.none,
                              ),
                            )
                          ],
                        ),
                      )
                    ]
                  )
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: GestureDetector(
                  onTap: () {
                    textFocusNode.requestFocus();
                    textController.selection = TextSelection.fromPosition(TextPosition(offset: textController.text.length));
                    SystemChannels.textInput.invokeMethod("TextInput.show");
                  },
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}

