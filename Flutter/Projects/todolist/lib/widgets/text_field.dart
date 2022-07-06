import 'package:flutter/material.dart';

Widget textFieldWidget(
    {required Size size,
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardtype,
    validator,
    String? errorText,
    TextInputAction textInputAction = TextInputAction.next,
    Color cursorColor = Colors.black,
    Color borderColor = Colors.black,
    double radius = 7,
    bool obscureText = false,
    onPressedSuffixIcon,
    IconData? suffixIcon}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      width: size.width * 0.8,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        cursorColor: cursorColor,
        decoration: InputDecoration(
            errorText: errorText,
            labelText: labelText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(radius)),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: onPressedSuffixIcon, icon: Icon(suffixIcon))
                : null),
      ),
    ),
  );
}
