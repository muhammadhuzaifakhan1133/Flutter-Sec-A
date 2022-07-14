import 'package:flutter/material.dart';

createOrRenameListDialog(
    {required BuildContext context,
    required Function() onPressedFinalButton,
    required String title,
    required String hintText,
    required String finalButtonText,
    required TextEditingController controller}) {
  bool isButtonEnable = false;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: TextField(
                  onChanged: (text) {
                    setState(() {
                      if (text.isNotEmpty) {
                        isButtonEnable = true;
                      } else {
                        isButtonEnable = false;
                      }
                    });
                  },
                  controller: controller,
                  decoration: InputDecoration(hintText: hintText)),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    isButtonEnable = false;
                    controller.text = "";
                  },
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                    onPressed: isButtonEnable ? onPressedFinalButton : null,
                    child: Text(finalButtonText))
              ],
            );
          },
        );
      });
}
