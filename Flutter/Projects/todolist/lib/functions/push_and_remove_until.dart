import 'package:flutter/material.dart';

pushAndRemoveUntil(BuildContext context, Widget destination) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => destination), (route) => false);
}
