import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/list_main_screen/rename_list_dialog.dart';
import 'package:todolist/widgets/sort_menu_item.dart';

popupMenuButton(
    {required setState,
    required TextEditingController renameController,
    required widget,
    Color? color = Colors.white}) {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: color),
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
                children: const [
                  Icon(Icons.delete, color: Colors.black),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Delete list"))
                ],
              ),
              onTap: () async {
                if (!(await InternetConnectionChecker().hasConnection)) {
                  Fluttertoast.showToast(msg: "No Internet Connection");
                  return;
                }
                await deleteList(listID: widget.listID);
                Navigator.pop(context);
              },
            ),
            sortMenuItem(context, widget, setState)
          ]);
}
