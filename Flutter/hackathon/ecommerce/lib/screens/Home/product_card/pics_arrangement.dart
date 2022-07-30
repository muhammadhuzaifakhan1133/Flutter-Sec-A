import 'package:flutter/material.dart';

List<Widget> arrangementOfPics(List<dynamic> imgPaths) {
  if (imgPaths.length == 0) return [];
  List<Widget> widgets = [];
  int noOfImages = imgPaths.length;
  switch (noOfImages) {
    case 1:
      widgets.add(putImage(imgPaths[0]));
      break;
    case 2:
      widgets.add(putImage(imgPaths[0]));
      widgets.add(putImage(imgPaths[1]));
      break;
    case 3:
      widgets.add(putImage(imgPaths[0]));
      widgets.add(Column(
        children: [putImage(imgPaths[1]), putImage(imgPaths[2])],
      ));
      break;
    case 4:
      widgets.add(putImage(imgPaths[0]));
      widgets.add(Column(
        children: [
          Row(children: [putImage(imgPaths[1]), putImage(imgPaths[2])]),
          putImage(imgPaths[3])
        ],
      ));
      break;
    default:
      widgets.add(putImage(imgPaths[0]));
      widgets.add(Column(
        children: [
          Row(children: [putImage(imgPaths[1]), putImage(imgPaths[2])]),
          Row(children: [putImage(imgPaths[3]), putImage(imgPaths[4])]),
        ],
      ));
  }
  return widgets;
}

Widget putImage(imgPath) {
  return Image(image: AssetImage(imgPath));
}
