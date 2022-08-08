import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';

renameListDialog({context, renameController, widget, setState}) {
  Future.delayed(const Duration(seconds: 0), () {
    createOrRenameListDialog(
        context: context,
        title: "Rename List",
        hintText: "Enter list tile",
        finalButtonText: "Save",
        controller: renameController,
        onPressedFinalButton: () async {
          if (!(await InternetConnectionChecker().hasConnection)) {
            Fluttertoast.showToast(msg: "No Internet Connection");
            return;
          }
          await renameList(
              listID: widget.listId, newName: renameController.text);
          setState(() {
            widget.listName = renameController.text;
          });
          Navigator.pop(context);
        });
  });
}
