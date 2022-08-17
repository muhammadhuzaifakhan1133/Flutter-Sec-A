import 'package:flutter/material.dart';

Widget textFieldWidget({
  required Size size,
  TextEditingController? controller,
  String? labelText,
  TextInputType? keyboardtype,
  validator,
  onFieldSubmitted,
  onChanged,
  String? errorText,
  String? hintText,
  bool? enabled,
  double widthPercent = 0.8,
  double heightPercent = 0.1,
  TextInputAction textInputAction = TextInputAction.next,
  Color cursorColor = Colors.black,
  Color borderColor = Colors.black,
  double radius = 7,
  bool obscureText = false,
  onPressedSuffixIcon,
  onPressedPrefixIcon,
  IconData? suffixIcon,
  IconData? prefixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: SizedBox(
      width: size.width * widthPercent,
      height: size.height * heightPercent,
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
          suffixIcon: IconButton(
              onPressed: onPressedSuffixIcon, icon: Icon(suffixIcon)),
          prefixIcon: IconButton(
              onPressed: onPressedPrefixIcon, icon: Icon(prefixIcon)),
        ),
      ),
    ),
  );
}
