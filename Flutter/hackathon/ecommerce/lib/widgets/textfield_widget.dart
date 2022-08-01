import 'package:flutter/material.dart';

Widget textFieldWidget(
    {required TextEditingController controller,
    required TextInputType keyboardtype,
    String? labelText,
    String? hintText,
    double? width,
    double? height,
    validator,
    onFieldSubmitted,
    String? errorText,
    FocusNode? focusNode,
    TextInputAction textInputAction = TextInputAction.next,
    Color cursorColor = Colors.black,
    Color borderColor = Colors.black,
    double radius = 7,
    double labelTextSize = 12,
    bool obscureText = false,
    onPressedSuffixIcon,
    onPressedPrefixIcon,
    onChanged,
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
        focusNode: focusNode,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        cursorColor: cursorColor,
        decoration: InputDecoration(
            hintText: hintText,
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
