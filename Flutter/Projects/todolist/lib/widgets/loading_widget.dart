import 'package:flutter/material.dart';

circleProgressDialog(BuildContext context) {
  FocusScope.of(context).unfocus();

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}
