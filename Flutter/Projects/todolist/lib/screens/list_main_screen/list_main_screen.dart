import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
      appBar: AppBar(
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
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
