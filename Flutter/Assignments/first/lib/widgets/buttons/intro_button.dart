import 'package:flutter/material.dart';

import '../../screens/login.dart';

introButton(context, btn_bgcolor) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btn_bgcolor)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
      child: Text(
        "INSTANT PAY",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
