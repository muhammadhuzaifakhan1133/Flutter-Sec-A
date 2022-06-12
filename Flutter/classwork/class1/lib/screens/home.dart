import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> chatnames = [];
  TextEditingController controller = TextEditingController();

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
            Container(
              color: Colors.yellow,
              child: TextField(
                controller: controller,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatnames.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      tileColor: Colors.grey,
                      title: Text(chatnames[i]),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  removeChat(i);
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  removeChat(i);
                                },
                                icon: Icon(Icons.update)),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
