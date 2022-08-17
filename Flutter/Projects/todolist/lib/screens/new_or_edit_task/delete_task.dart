import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase/list_and_task.dart';
import 'package:todolist/widgets/loading_widget.dart';

IconButton deleteTaskIcon(BuildContext Context, String taskID) {
  return IconButton(
      onPressed: () {
        Future.delayed(const Duration(seconds: 0), () {
          showDialog(
              context: Context,
              builder: (context) => AlertDialog(
                    title: const Text("Delete Task"),
                    content: const Text("Do you want to delete this task"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("CANCEL")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () async {
                            circleProgressDialog(context);
                            if (!(await InternetConnectionChecker()
                                .hasConnection)) {
                              closeDialog(context);
                              Fluttertoast.showToast(
                                  msg: "No Internet Connection");
                              return;
                            }
                            await deleteTask(taskID: taskID);
                            closeDialog(context);
                            Navigator.pop(context);
                            Navigator.pop(Context);
                          },
                          child: Text("DELETE"))
                    ],
                  ));
        });
      },
      icon: const Icon(Icons.delete, color: Colors.black));
}
