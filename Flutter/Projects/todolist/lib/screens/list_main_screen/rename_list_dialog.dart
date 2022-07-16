import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';

renameListDialog({context, renameController, widget, email, setState}) {
  Future.delayed(const Duration(seconds: 0), () {
    createOrRenameListDialog(
        context: context,
        title: "Rename List",
        hintText: "Enter list tile",
        finalButtonText: "Save",
        controller: renameController,
        onPressedFinalButton: () async {
          await renameList(
              listID: widget.listId,
              email: email,
              newName: renameController.text);
          setState(() {
            widget.listName = renameController.text;
          });
          Navigator.pop(context);
        });
  });
}
