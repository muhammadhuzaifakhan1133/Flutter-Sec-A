import 'package:flutter/material.dart';

Column titleWithImage(
    {required Size size,
    required ThemeData theme,
    required String title,
    required String imgPath,
    required String subTitle,
    double? imgWidth,
    double? imgHeight,
    double topPaddingPercent = 0.05,
    double afterTitlePaddingPercent = 0.0}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: size.height * topPaddingPercent),
        child: Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
      ),
      SizedBox(height: size.height * afterTitlePaddingPercent),
      Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage(imgPath),
            width: imgWidth,
            height: imgHeight,
          ),
          Positioned(
            bottom: 0,
            child: Text(
              subTitle,
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      )
    ],
  );
}
