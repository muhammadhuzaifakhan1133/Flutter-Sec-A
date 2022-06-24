import 'package:flutter/material.dart';

Widget bottomNavigationBar({required onNewPressed, required onFolderPressed}) {
  return Padding(
    padding: const EdgeInsets.all(11.0),
    child: BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onNewPressed,
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 35,
                ),
                Text("New list",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          IconButton(
              onPressed: onFolderPressed,
              icon: Icon(
                Icons.add_card_sharp,
                color: Colors.blue,
              ))
        ],
      ),
    ),
  );
}
