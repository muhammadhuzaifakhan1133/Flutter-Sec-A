import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListMainScreen extends StatefulWidget {
  ListMainScreen({required this.listId, required this.listName, Key? key})
      : super(key: key);
  String listId;
  String listName;
  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(widget.listId), Text(widget.listName)],
        ),
      ),
    );
  }
}
