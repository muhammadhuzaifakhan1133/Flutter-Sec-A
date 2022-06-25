import 'package:class1/screens/home/home.dart';
import 'package:flutter/material.dart';

class TaskMainScreen extends StatefulWidget {
  const TaskMainScreen({Key? key}) : super(key: key);

  @override
  State<TaskMainScreen> createState() => _TaskMainScreenState();
}

class _TaskMainScreenState extends State<TaskMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenuButton(
              splashRadius: 20,
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Rename"),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // deleteHistory();
                      },
                    ),
                    PopupMenuItem(
                      child: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Icon(Icons.sort, color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text("Sort by"),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // deleteHistory();
                      },
                    ),
                  ])
        ],
      ),
    );
  }
}
