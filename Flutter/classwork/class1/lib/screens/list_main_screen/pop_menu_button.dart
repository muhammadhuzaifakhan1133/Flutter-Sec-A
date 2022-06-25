import 'package:flutter/material.dart';

popMenuButton({onRenamePressed, onDeletePressed, onSortPressed}) {
  return PopupMenuButton(
      splashRadius: 20,
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Rename"),
                  ),
                ],
              ),
              onTap: onRenamePressed,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.sort, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Sort by"),
                  ),
                ],
              ),
              onTap: onSortPressed,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Delete list"),
                  ),
                ],
              ),
              onTap: onDeletePressed,
            ),
          ]);
}
