import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:notes/main.dart';
import 'package:universal_io/io.dart';

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
          /*final dio = getDio(token: server.token);
          final serverHelloResponse = (await getDio().get('https://${server.address}/api/hello'));

          if(serverHelloResponse.data["response"]["hello"] != "Hi!") return;
          if(serverHelloResponse.data["response"]["api_version"] != "v1.0") return;

          final lastEventResponse = await dio.get("https://${server.address}/api/v1.0/chain/notes/last");
          if(lastEventResponse.data.containsKey("error")) return;
          final String lastEventId = lastEventResponse.data["response"]["last"];

          if(lastEventId != server.lastEventId) {
            Map<String, dynamic> newEvents = {};

            String eventIdToFetch = lastEventId;
            while(eventIdToFetch != server.lastEventId) {
              final fetchEventResponse = await dio.get("https://${server.address}/api/v1.0/chain/notes/event/$eventIdToFetch");
              if(fetchEventResponse.data.containsKey("error")) return;
              newEvents[eventIdToFetch] = fetchEventResponse.data;
              if(fetchEventResponse.data["response"]["event"].containsKey("parent")) {
                eventIdToFetch = fetchEventResponse.data["response"]["event"]["parent"];
              } else {
                break;
              }
            }
            print(newEvents);
          }*/
      }
    });
  }
}