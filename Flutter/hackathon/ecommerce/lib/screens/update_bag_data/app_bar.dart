import 'package:flutter/material.dart';

updateOrderSceenAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context, false);
      },
    ),
    title: const Text("Update Order", style: TextStyle(color: Colors.black)),
  );
}
