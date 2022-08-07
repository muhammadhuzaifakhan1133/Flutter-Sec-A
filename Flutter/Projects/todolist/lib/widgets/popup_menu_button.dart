import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/list_main_screen/rename_list_dialog.dart';

popupMenuButton(
    {required setState,
    required TextEditingController renameController,
    required widget}) {
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.edit, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Rename list"),
                  ),
                ],
              ),
              onTap: () {
                renameListDialog(
                    context: context,
                    renameController: renameController,
                    widget: widget,
                    setState: setState);
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.black),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Delete list"))
                ],
              ),
              onTap: () {
                deleteList(listID: widget.listID);
                Navigator.pop(context);
              },
            )
          ]);
}
