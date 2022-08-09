import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/rename_list_dialog.dart';

listScreenTitle(
    {context, renameController, widget, setState, color = Colors.white}) {
  return InkWell(
    onTap: () {
      renameListDialog(
          context: context,
          renameController: renameController,
          widget: widget,
          setState: setState);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(widget.listName,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 24)),
    ),
  );
}
