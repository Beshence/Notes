import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ServersBox {
  late final Store _store;
  late final Box<Server> _serversBox;

  ServersBox._create(this._store) {
    _serversBox = Box<Server>(_store);
  }

  static Future<ServersBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storeDir = join(docsDir.path, "serversbox");
    final Store store;
    if (Store.isOpen(storeDir)) {
      store = Store.attach(getObjectBoxModel(), storeDir);
    } else {
      store = await openStore(directory: storeDir);
    }
    return ServersBox._create(store);
  }

  void setServer(Server server) => _serversBox.put(server);
  Server? getServer() => _serversBox.count() > 0 ? _serversBox.getAll()[0] : null;

}

@Entity()
class Server {
  @Id()
  int objectBoxId;
  @Unique()
  String address;
  String token;
  @Unique()
  int order;
  String? lastEventId;

  Server({this.objectBoxId = 0, required this.address, required this.token, required this.order, required this.lastEventId});
}