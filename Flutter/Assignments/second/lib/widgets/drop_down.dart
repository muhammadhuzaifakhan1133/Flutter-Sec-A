import 'package:flutter/material.dart';

Widget customDropDown(List<String> items, void onChange(val), {val}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<String>(
        value: val,
        onChanged: (String? val) {
          onChange(val);
        },
        items: items.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(),
      ));
}
