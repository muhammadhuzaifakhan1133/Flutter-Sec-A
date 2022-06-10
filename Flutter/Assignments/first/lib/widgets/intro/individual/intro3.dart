import 'package:flutter/material.dart';

introDescription({description_text}) {
  return Container(
    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Text(
      "${description_text}",
      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    ),
  );
}
