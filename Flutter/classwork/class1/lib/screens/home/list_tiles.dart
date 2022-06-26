import 'package:class1/screens/list_main_screen/list_main_screen.dart';
import 'package:flutter/material.dart';

Expanded ListTiles({lists, functionAfterBack}) {
  return Expanded(
    child: ListView.builder(
      itemCount: lists.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.white,
          title: Text(lists[index]),
          leading: Icon(
            Icons.format_list_bulleted_outlined,
            color: Color.fromARGB(255, 132, 92, 139),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ListMainScreen(list_name: lists[index]))).then((_) {
              // you have come back to your Settings screen
              functionAfterBack;
            });
          },
        );
      },
    ),
  );
}
