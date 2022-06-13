import 'package:flutter/material.dart';

squareSectionWidget(
    {required String title,
    required List<IconData> icons,
    required List<String> labels}) {
  assert(labels.length == icons.length);
  List<Widget> pairs = [];
  for (var i = 0; i < icons.length; i++) {
    Widget container_with_label = Container(
      // color: Colors.blue,
      padding: EdgeInsets.only(right: 7.5, left: 7.5),
      // width: 74,
      // height: 50,
      child: Column(
        children: [
          Container(
              width: 59,
              height: 60,
              padding: EdgeInsets.all(3),
              // color: Colors.purple[900],
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple[900]),
              child: Icon(icons[i])),
          Text(
            labels[i],
            style: TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
          )
        ],
      ),
    );
    pairs.add(container_with_label);
  }
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: pairs,
        )
      ],
    ),
  );
}
