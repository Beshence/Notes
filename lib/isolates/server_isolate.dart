import 'dart:isolate';

import 'package:beshence_vault/beshence_vault.dart';

import '../boxes/servers_box.dart';
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
          ServersBox serversBox = await ServersBox.create();
          Server? server = serversBox.getServer();
          if (server == null) return;

          BeshenceVault vault = BeshenceVault(address: server.address, token: server.token);
          final BeshenceChain chain = vault.getChain("notes");
          final String? lastEventId = await chain.lastEventId;

          if(lastEventId != server.lastEventId) {
            Map<String, dynamic> newEvents = {};

            String? eventIdToFetch = lastEventId;
            while(eventIdToFetch != server.lastEventId && eventIdToFetch != null) {
              final event = await chain.getEvent(eventIdToFetch);
              newEvents[eventIdToFetch] = event;
              eventIdToFetch = event["parent"];
            }
            print(newEvents);
          }
      }
    });
  }
}