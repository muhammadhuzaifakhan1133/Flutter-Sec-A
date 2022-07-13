import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/list_main_screen/list_main_screen.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';
import 'package:todolist/widgets/loading_widget.dart';

createNewList(
    {required setState,
    required BuildContext context,
    required TextEditingController controller,
    required String email,
    required List<String> existListIds,
    required List<String> listNames}) {
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
        try {
          String newListId = await saveListName(
              email: email,
              newList: controller.text,
              existListIds: existListIds);
          existListIds.add(newListId);
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
          Navigator.of(context, rootNavigator: true).pop();
          return;
        }
        setState(() {
          listNames.add(controller.text);
          controller.text = "";
        });
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListMainScreen(
                    listId: existListIds.last, listName: listNames.last)));
      });
}
