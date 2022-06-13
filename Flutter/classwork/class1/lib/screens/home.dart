import 'package:class1/widgets/listview.dart';
import 'package:class1/widgets/txtfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> chatnames = [];
  TextEditingController controller = TextEditingController();
  TextEditingController update_controller = TextEditingController();

  addChat() {
    setState(() {
      chatnames.add(controller.text);
      controller.clear();
    });
  }

  removeChat(i) {
    setState(() {
      chatnames.removeAt(i);
    });
  }

  removeAllChat() {
    setState(() {
      chatnames = [];
    });
  }

  updateChat(context, i) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: Text("Update"),
              content: TextField(
                decoration: InputDecoration(hintText: chatnames[i]),
                controller: update_controller,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      update_controller.clear();
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        chatnames[i] = update_controller.text;
                      });
                      Navigator.pop(context);
                      update_controller.clear();
                    },
                    child: Text("OK"))
              ],
            ));
  }

  tileButtons(i) {
    return <Widget>[
      IconButton(
          onPressed: () {
            removeChat(i);
          },
          icon: Icon(Icons.delete)),
      IconButton(
          onPressed: () {
            updateChat(context, i);
          },
          icon: Icon(Icons.edit)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Learning"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  addChat();
                },
                child: Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  removeAllChat();
                },
                child: Icon(Icons.delete_forever))
          ],
        ),
        body: Column(
          children: [
            textFieldWidget(controller),
            SizedBox(height: 20),
            listViewWidget(chatnames, tileButtons),
          ],
        ));
  }
}
