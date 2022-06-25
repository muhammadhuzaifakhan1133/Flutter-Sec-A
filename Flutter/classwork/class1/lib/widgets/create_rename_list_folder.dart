import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

createRenameListOrFolder(
    {context,
    controller,
    hintText,
    dialogTitile,
    finalButtonText,
    onPressedfinalButton}) {
  bool isButtonEnable = false;
  String newName = "";
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(dialogTitile),
            content: TextFormField(
              onChanged: (text) {
                setState(() {
                  if (text.isNotEmpty) {
                    isButtonEnable = true;
                  } else {
                    isButtonEnable = false;
                  }
                });
                controller.text = text;
              },
              decoration: InputDecoration(hintText: hintText),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  isButtonEnable = false;
                },
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                onPressed: isButtonEnable ? onPressedfinalButton : null,
                child: Text(finalButtonText),
              )
            ],
          );
        });
      });
}
