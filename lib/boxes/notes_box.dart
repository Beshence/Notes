import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class NotesBox {
  late final Store _store;
  late final Box<Note> _localNotesBox;
  late final Box<Note> _serverNotesBox;

  NotesBox._create(this._store) {
    _localNotesBox = Box<Note>(_store);
    _serverNotesBox = Box<Note>(_store);
  }

  static Future<NotesBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storeDir = join(docsDir.path, "notesbox");
    final Store store;
    if (Store.isOpen(storeDir)) {
      store = Store.attach(getObjectBoxModel(), storeDir);
    } else {
      store = await openStore(directory: storeDir);
    }
    return NotesBox._create(store);
  }

  List<Note> getAllLocalNotes() => _localNotesBox.getAll();
  List<Note> getAllLocalNotesSorted() => (_localNotesBox.query()..order(Note_.modifiedAt, flags: Order.descending)).build().find();
  void addLocalNote(Note note) => _localNotesBox.put(note, mode: PutMode.insert);
  void updateLocalNote(Note note) => _localNotesBox.put(note, mode: PutMode.update);
  Note getLocalNote(String id) => _localNotesBox.query(Note_.id.equals(id)).build().find()[0];
  void deleteLocalNote(Note note) => _localNotesBox.remove(note.objectBoxId);
  int get localNotesLength => _localNotesBox.count();

  List<Note> getAllServerNotes() => _serverNotesBox.getAll();
  void addServerNote(Note note) => _serverNotesBox.put(note, mode: PutMode.insert);
  void updateServerNote(Note note) => _serverNotesBox.put(note, mode: PutMode.update);
  Note getServerNote(String id) => _serverNotesBox.query(Note_.id.equals(id)).build().find()[0];
  void deleteServerNote(Note note) => _serverNotesBox.remove(note.objectBoxId);
}

@Entity()
class Note {
  @Id()
  int objectBoxId;
  @Unique()
  String id;
  DateTime modifiedAt;
  String? title;
  String? text;

  Note({this.objectBoxId = 0, required this.id, required this.modifiedAt, required this.title, required this.text});
}
