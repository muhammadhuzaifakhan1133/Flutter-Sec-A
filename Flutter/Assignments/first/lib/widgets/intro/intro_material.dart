import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/intro/individual/intro1.dart';
import 'package:first/widgets/intro/individual/intro2.dart';
import 'package:first/widgets/intro/individual/intro3.dart';
import 'package:first/widgets/intro/last_page_material.dart';
import 'package:flutter/material.dart';

introMaterial({img, title, description, slide_num, context}) {
  var constants = UserConstants();
  List<Widget> children = [
    introImg(bgcolor: constants.theme, img: img, context: context),
    introTitle(title: title),
    introDescription(description_text: description)
  ];
  var widget = Container(
    margin: const EdgeInsets.only(top: 160, bottom: 100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
  if (slide_num == constants.no_of_slides - 1) {
    children.add(lastPageMaterial(context));
  }
  return widget;
}
