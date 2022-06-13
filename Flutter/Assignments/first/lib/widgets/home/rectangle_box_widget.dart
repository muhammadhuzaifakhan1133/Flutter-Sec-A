import 'package:flutter/material.dart';

rectangleBoxWidget({left_color, icon, right_color, text}) {
  return Container(
    margin: EdgeInsets.only(right: 6),
    // decoration: BoxDecoration(
    //     color: Colors.red,
    //     border: Border.all(color: Colors.black),
    //     borderRadius: BorderRadius.all(Radius.circular(15))),
    width: 175,
    height: 50,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: left_color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          width: 44,
          height: 50,
          child: Icon(icon),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                    color: right_color,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Text(text,
                    style: TextStyle(color: Colors.white, fontSize: 16))))
      ],
    ),
  );
}
