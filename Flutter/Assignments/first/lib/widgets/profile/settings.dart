import 'package:flutter/material.dart';

settingCard({List<String>? titles, List<String>? leftImages}) {
  assert(titles!.length == leftImages!.length);
  List<Widget> childrens = [];
  for (var i = 0; i < titles!.length; i++) {
    Widget tile = ListTile(
      leading: Image(image: AssetImage(leftImages![i])),
      title: Text(
        titles[i],
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
    childrens.add(tile);
  }
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color(0xff1F222A),
      elevation: 10,
      child: Container(
          width: double.infinity,
          child: Column(
            children: childrens,
          )));
}
