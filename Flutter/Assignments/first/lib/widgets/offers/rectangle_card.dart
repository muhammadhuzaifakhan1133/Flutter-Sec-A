import 'package:flutter/material.dart';

textWidget({title, size}) {
  return Text(
    title,
    style: TextStyle(color: Colors.white, fontSize: size),
  );
}

rectangleCardWidget({context, image, title, subtitle1, subtitle2, color}) {
  List<Widget> all_text = [];
  var text_param = [title, subtitle1, subtitle2];
  for (var i = 0; i < text_param.length; i++) {
    if (text_param[i] != null) {
      if (i != 2) {
        all_text.add(textWidget(title: text_param[i], size: 15.0 - i));
      } else {
        all_text.add(SizedBox(
          width: 250,
          child: textWidget(title: text_param[i], size: 12.0),
        ));
      }
    }
  }
  all_text.insert(
      1,
      SizedBox(
        height: 5,
      ));
  if (all_text.length == 4) {
    all_text.insert(
        all_text.length - 1,
        SizedBox(
          height: 4,
        ));
  }
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    width: double.infinity,
    height: 101,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 15,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                Image(image: AssetImage("assets/images/offers_bg_img.png")),
                Image(image: AssetImage(image))
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: all_text)
          ],
        ),
      ),
    ),
  );
}
