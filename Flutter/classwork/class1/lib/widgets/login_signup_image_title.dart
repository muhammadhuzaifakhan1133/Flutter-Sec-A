import 'package:class1/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';

class ImageAndTile extends StatefulWidget {
  ImageAndTile(
      {required this.title,
      required this.image,
      required this.imageTitle,
      required this.gapBeforeWidget,
      required this.gapAfterWidget,
      Key? key})
      : super(key: key);
  String title, image, imageTitle;
  double gapBeforeWidget, gapAfterWidget;
  @override
  State<ImageAndTile> createState() => _ImageAndTileState();
}

class _ImageAndTileState extends State<ImageAndTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * widget.gapBeforeWidget),
        Text(widget.title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Algerian",
                fontSize: 26)),
        Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(widget.image),
            ),
            Positioned(
                bottom: 0,
                child: Text(widget.imageTitle,
                    style: TextStyle(color: subTextColor, fontSize: 18)))
          ],
        ),
        SizedBox(height: size.height * widget.gapAfterWidget),
      ],
    );
  }
}
