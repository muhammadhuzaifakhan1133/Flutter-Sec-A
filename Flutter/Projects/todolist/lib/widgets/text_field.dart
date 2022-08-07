import 'package:flutter/material.dart';

Widget textFieldWidget(
    {required Size size,
    TextEditingController? controller,
    String? labelText,
    TextInputType? keyboardtype,
    validator,
    onFieldSubmitted,
    onChanged,
    String? errorText,
    String? hintText,
    bool? enabled,
    TextInputAction textInputAction = TextInputAction.next,
    Color cursorColor = Colors.black,
    Color borderColor = Colors.black,
    double radius = 7,
    bool obscureText = false,
    onPressedSuffixIcon,
    IconData? suffixIcon}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: SizedBox(
      width: size.width * 0.8,
      child: TextFormField(
        validator: validator,
        enabled: enabled,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardtype,
        textInputAction: textInputAction,
        onChanged: onChanged,
        cursorColor: cursorColor,
        decoration: InputDecoration(
            errorText: errorText,
            labelText: labelText,
            hintText: hintText,
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
