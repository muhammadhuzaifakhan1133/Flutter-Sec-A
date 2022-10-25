import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

onCopyText({required String codeValue}) async {
  if (codeValue.isEmpty) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: "No Text Found");
    return;
  }
  await Clipboard.setData(ClipboardData(text: codeValue));
  Fluttertoast.showToast(msg: "Copied to Clipboard");
}
