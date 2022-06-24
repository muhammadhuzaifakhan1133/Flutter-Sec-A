import 'package:flutter/material.dart';

Expanded taskTiles(lists) {
  return Expanded(
    child: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lists[index]),
            leading: Icon(
              Icons.format_list_bulleted_outlined,
              color: Color.fromARGB(255, 132, 92, 139),
            ),
          );
        }),
  );
}
