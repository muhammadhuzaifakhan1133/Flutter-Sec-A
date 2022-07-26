import 'package:flutter/material.dart';

renderProductImgSlides({
  required List<dynamic> imgPaths,
}) {
  List<Widget> slides = [];
  for (int i = 0; i < imgPaths.length; i++) {
    slides.add(Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgPaths[i]), fit: BoxFit.cover)),
    ));
  }
  return slides;
}
