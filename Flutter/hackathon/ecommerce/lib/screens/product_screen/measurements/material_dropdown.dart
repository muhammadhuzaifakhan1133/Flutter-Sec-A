import 'package:flutter/material.dart';

Padding materialDropDown(
    {required String dropDownValue,
    required List<String> materials,
    required onChanged}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: Row(
      children: [
        const Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: Text(
            "Material",
            style: TextStyle(fontSize: 18),
          ),
        ),
        DropdownButton(
          value: dropDownValue,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          items: materials.map((String material) {
            return DropdownMenuItem(child: Text(material), value: material);
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    ),
  );
}
