import 'package:beshence_vault/beshence_vault.dart';
import 'package:flutter/material.dart';

import '../boxes/servers_box.dart';
import '../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}


class _SettingsScreenState extends State<SettingsScreen> {
  final addressController = TextEditingController();
  final tokenController = TextEditingController();
  Server? server = serversBox.getServer();

  @override
  void dispose() {
    addressController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    addressController.text = server != null ? server!.address : '';
    tokenController.text = server != null ? server!.token : '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Server settings"),
      ),
      body: Column(
        children: [
          TextField(
            controller: addressController,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Address"
            ),
          ),
          TextField(
            controller: tokenController,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Token"
            ),
          ),
          MaterialButton(child: Text("Save"), onPressed: () async {
            BeshenceVault vault = BeshenceVault(address: addressController.text);
            BeshenceVaultInfo vaultInfo = await vault.getVaultInfo();
            /*final dio = getDio(token: tokenController.text);
            final serverHelloResponse = (await dio.get('https://${addressController.text}/api/hello'));
            print(serverHelloResponse.data);

            if(serverHelloResponse.data["response"]["hello"] != "Hi!") return;
            if(serverHelloResponse.data["response"]["api_version"] != "v1.0") return;

            final chainResponse = await dio.get('https://${addressController.text}/api/v1.0/chain/notes/last');
            print("chainResponse");
            print(chainResponse.data);
            if((chainResponse.data as Map<String, dynamic>).containsKey("error")) {
              if(chainResponse.data["error"]["name"] == "chain_not_initialized") {
                final chainCreationResponse = await dio.post('https://${addressController.text}/api/v1.0/chain/notes', data: {});
                print("chainCreationResponse");
                print(chainCreationResponse.data);
                if(chainCreationResponse.statusCode != 201) return;
              } else if(chainResponse.data["error"]["name"] == "last_not_found") {

              } else return;
            }

            if(server == null) {
              server = Server(address: addressController.text, token: tokenController.text, order: 0, lastEventId: null);
            } else {
              server!.address = addressController.text;
              server!.token = tokenController.text;
            }*/
            serversBox.setServer(server!);
          })
        ],
      ),
    );
  }
}