import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/list_main_screen/list_main_screen.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';
import 'package:todolist/widgets/loading_widget.dart';

createNewList({
  required BuildContext context,
  required TextEditingController controller,
  required String email,
}) {
  return createOrRenameListDialog(
      context: context,
      controller: controller,
      title: "New list",
      hintText: "Enter list tile",
      finalButtonText: "CREATE LIST",
      onPressedFinalButton: () async {
        circleProgressDialog(context);
        if (!(await InternetConnectionChecker().hasConnection)) {
          Fluttertoast.showToast(msg: "No Internet Connection");
          return;
        }
        String newListId;
        try {
          newListId =
              await saveListName(email: email, newListName: controller.text);
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
          closeDialog(context);
          return;
        }
        // ignore: use_build_context_synchronously
        closeDialog(context);
        // ignore: use_build_context_synchronously
        closeDialog(context);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListMainScreen(
                    listId: newListId, listName: controller.text)));
        controller.text = "";
      });
}
