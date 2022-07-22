import 'package:flutter/material.dart';

Widget textFieldWidget(
    {required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardtype,
    double? width,
    double? height,
    double? cursorHeight,
    validator,
    onFieldSubmitted,
    String? errorText,
    TextInputAction textInputAction = TextInputAction.next,
    Color cursorColor = Colors.black,
    Color borderColor = Colors.black,
    double radius = 7,
    double labelTextSize = 12,
    bool obscureText = false,
    onPressedSuffixIcon,
    onPressedPrefixIcon,
    Color? bgColor,
    IconData? suffixIcon,
    IconData? prefixIcon}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      color: bgColor,
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        decoration: InputDecoration(
            errorText: errorText,
            labelText: labelText,
            labelStyle: TextStyle(fontSize: labelTextSize),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(radius)),
            prefixIcon: prefixIcon != null
                ? IconButton(
                    onPressed: onPressedPrefixIcon, icon: Icon(prefixIcon))
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: onPressedSuffixIcon, icon: Icon(suffixIcon))
                : null),
      ),
    ),
  );
}
