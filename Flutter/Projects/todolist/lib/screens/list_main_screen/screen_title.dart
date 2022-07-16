import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/rename_list_dialog.dart';

listScreenTitle({context, renameController, widget, email, setState}) {
  return InkWell(
    onTap: () {
      renameListDialog(
          context: context,
          renameController: renameController,
          widget: widget,
          email: email,
          setState: setState);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(widget.listName,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
    ),
  );
}
