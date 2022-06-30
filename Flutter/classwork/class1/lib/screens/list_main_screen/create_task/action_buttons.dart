import 'package:flutter/material.dart';

List<Widget> actionButtons(BuildContext context, timeController, dateController,
    bool isButtonEnable, onPressedfinalButton, finalButtonText) {
  return <Widget>[
    TextButton(
      onPressed: () {
        Navigator.pop(context);
        timeController.text = "";
        dateController.text = "";
        isButtonEnable = false;
      },
      child: Text("CANCEL"),
    ),
    ElevatedButton(
      onPressed: isButtonEnable ? onPressedfinalButton : null,
      child: Text(finalButtonText),
    )
  ];
}
