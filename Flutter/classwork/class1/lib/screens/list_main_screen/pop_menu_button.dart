import 'package:flutter/material.dart';

popMenuButton(
    {onRenamePressed,
    onDeletePressed,
    onSortPressed,
    enableRename = true,
    enableSort = true,
    enableDelete = true}) {
  List<bool> enablility = [enableRename, enableSort, enableDelete];
  List<String> names = ["Rename", "Sort by", "Delete list"];
  List<IconData> icons = [Icons.edit, Icons.sort, Icons.delete];
  List<dynamic> functions = [onRenamePressed, onSortPressed, onDeletePressed];
  List<PopupMenuEntry<dynamic>> items = [];
  for (var i = 0; i < names.length; i++) {
    if (enablility[i]) {
      items.add(PopupMenuItem(
        child: Row(
          children: [
            Icon(icons[i], color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(names[i]),
            ),
          ],
        ),
        onTap: functions[i],
      ));
    }
  }
  return PopupMenuButton(
      splashRadius: 20,
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (context) => items);
}
