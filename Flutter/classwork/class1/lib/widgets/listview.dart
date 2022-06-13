import 'package:flutter/material.dart';

listViewWidget(chatnames, tileButtons) {
  return Expanded(
      child: ListView.separated(
    itemCount: chatnames.length,
    itemBuilder: (context, i) {
      return ListTile(
          title: Text(chatnames[i]),
          trailing: Container(
            width: 100,
            child: Row(
              children: tileButtons(i),
            ),
          ));
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 2,
      );
    },
  ));
}
