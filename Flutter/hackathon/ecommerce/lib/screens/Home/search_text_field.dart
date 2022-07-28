import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

Widget searchTextFeild(
    {required Size screenSize,
    required TextEditingController controller,
    required onChanged}) {
  return textFieldWidget(
      height: screenSize.height * 0.06,
      width: screenSize.width * 0.7,
      prefixIcon: Icons.search,
      suffixIcon: Icons.close,
      controller: controller,
      labelText: "Search",
      onChanged: onChanged,
      keyboardtype: TextInputType.text,
      textInputAction: TextInputAction.search);
}
