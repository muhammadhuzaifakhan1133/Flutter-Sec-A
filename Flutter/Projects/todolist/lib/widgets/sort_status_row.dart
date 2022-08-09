import 'package:flutter/material.dart';

InkWell sortStatusRow(widget, setState, {Color? color = Colors.white}) {
  return InkWell(
    onTap: () {
      setState(() {
        widget.descending = !widget.descending;
      });
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Sorted ${widget.sortKey} ",
              style: TextStyle(
                  fontSize: 16, color: color, fontWeight: FontWeight.bold),
            ),
          ),
          widget.descending
              ? Icon(Icons.keyboard_arrow_down, color: color)
              : Icon(Icons.keyboard_arrow_up, color: color)
        ]),
        IconButton(
            onPressed: () {
              setState(() {
                widget.descending = false;
                widget.sortBy = "normal";
              });
            },
            icon: Icon(Icons.close, color: color))
      ],
    ),
  );
}
