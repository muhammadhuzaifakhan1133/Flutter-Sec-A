import 'package:flutter/material.dart';

Container customButton({
  required BuildContext context,
  required double widthPercent,
  required Color color,
  required double heightPercent,
  required onpressed,
}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * widthPercent,
    height: size.height * heightPercent,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
      child: const Text(
        "MASUK",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
