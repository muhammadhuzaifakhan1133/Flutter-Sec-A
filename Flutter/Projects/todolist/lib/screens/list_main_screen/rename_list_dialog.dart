import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase/list_and_task.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';
import 'package:todolist/widgets/loading_widget.dart';

renameListDialog({context, renameController, widget, setState}) {
  Future.delayed(const Duration(seconds: 0), () {
    createOrRenameListDialog(
        context: context,
        title: "Rename List",
        hintText: "Enter list tile",
        finalButtonText: "Save",
        controller: renameController,
        onPressedFinalButton: () async {
          circleProgressDialog(context);
          if (!(await InternetConnectionChecker().hasConnection)) {
            closeDialog(context);
            Fluttertoast.showToast(msg: "No Internet Connection");
            return;
          }

          await renameList(
              listID: widget.listId, newName: renameController.text);
          closeDialog(context);
          setState(() {
            widget.listName = renameController.text;
          });
          Navigator.pop(context);
        });
  });
}
