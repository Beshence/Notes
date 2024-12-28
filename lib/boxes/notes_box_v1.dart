import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class NotesBoxV1 {
  late final Store _store;
  late final Box<NoteV1> _localNotesBox;
  late final Box<NoteV1> _serverNotesBox;

  NotesBoxV1._create(this._store) {
    _localNotesBox = Box<NoteV1>(_store);
    _serverNotesBox = Box<NoteV1>(_store);
  }

  static Future<NotesBoxV1> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storeDir = join(docsDir.path, "notes_notesbox_v1");
    final Store store;
    if (Store.isOpen(storeDir)) {
      store = Store.attach(getObjectBoxModel(), storeDir);
    } else {
      store = await openStore(directory: storeDir);
    }
    return NotesBoxV1._create(store);
  }

  List<NoteV1> getAllLocalNotes() => _localNotesBox.getAll();
  List<NoteV1> getAllLocalNotesSorted() => (_localNotesBox.query()..order(NoteV1_.modifiedAt, flags: Order.descending)).build().find();
  void addLocalNote(NoteV1 note) => _localNotesBox.put(note, mode: PutMode.insert);
  void updateLocalNote(NoteV1 note) => _localNotesBox.put(note, mode: PutMode.update);
  NoteV1 getLocalNote(String id) => _localNotesBox.query(NoteV1_.id.equals(id)).build().find()[0];
  void deleteLocalNote(NoteV1 note) => _localNotesBox.remove(note.objectBoxId);
  int get localNotesLength => _localNotesBox.count();

  List<NoteV1> getAllServerNotes() => _serverNotesBox.getAll();
  void addServerNote(NoteV1 note) => _serverNotesBox.put(note, mode: PutMode.insert);
  void updateServerNote(NoteV1 note) => _serverNotesBox.put(note, mode: PutMode.update);
  NoteV1 getServerNote(String id) => _serverNotesBox.query(NoteV1_.id.equals(id)).build().find()[0];
  void deleteServerNote(NoteV1 note) => _serverNotesBox.remove(note.objectBoxId);
}

@Entity()
class NoteV1 {
  @Id()
  int objectBoxId;
  @Unique()
  String id;
  DateTime modifiedAt;
  String? title;
  String? text;

  NoteV1({this.objectBoxId = 0, required this.id, required this.modifiedAt, required this.title, required this.text});
}
