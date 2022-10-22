import 'package:first/widgets/button_widget.dart';
import 'package:flutter/material.dart';

textWidget({title, size}) {
  return Text(
    title,
    style: TextStyle(color: Colors.white, fontSize: size),
  );
}

rectangleCardWidget(
    {context,
    image,
    title,
    subtitle1,
    subtitle2,
    color,
    width = double.infinity,
    height = 101.0,
    enableCollectbtn = false,
    collectBtnColor = const Color.fromRGBO(250, 77, 250, 1),
    collectBtnTextColor = Colors.white,
    collectBtnWidth = 100.0,
    collectBtnHeight = 28.0,
    collectBtnText = "Collect Now"}) {
  List<Widget> all_text = [];
  var text_param = [title, subtitle1, subtitle2];
  for (var i = 0; i < text_param.length; i++) {
    if (text_param[i] != null) {
      if (i != 2) {
        all_text.add(textWidget(title: text_param[i], size: 15.0 - i));
      } else {
        all_text.add(SizedBox(
          width: 219,
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
  if (enableCollectbtn) {
    Widget collectBtn = buttonWidget(
      context: context,
      text: collectBtnText,
      width: collectBtnWidth,
      height: collectBtnHeight,
      text_color: collectBtnTextColor,
      text_size: 15.0,
      button_color: collectBtnColor,
    );
    all_text.add(collectBtn);
  }
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Card(
      shape: RoundedRectangleBorder(
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
