import 'package:flutter/material.dart';

customTextField({
  required BuildContext context,
  String? labelText,
  String? hintText,
  double radius = 20,
  double widthPercent = 0.8,
  double heightPercent = 0.07,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size.width * widthPercent,
      height: size.height * heightPercent,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          label: labelText != null ? Text(labelText) : null,
          hintText: hintText,
          fillColor: Colors.white,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    ),
  );
}
