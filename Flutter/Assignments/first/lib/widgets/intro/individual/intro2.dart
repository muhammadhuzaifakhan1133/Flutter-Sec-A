import 'package:flutter/material.dart';

introTitle({title}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      "${title}",
      style: TextStyle(color: Colors.white, fontSize: 25),
    ),
  );
}
