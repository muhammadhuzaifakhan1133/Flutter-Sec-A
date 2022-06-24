import 'package:class1/screens/profile/profile_circle_image.dart';
import 'package:flutter/material.dart';

profileArea(context, name, email) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 6.0, right: 6.0, left: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: "profile-pic",
                child: CircleImage(name != "" ? name[0] : " ",
                    radius: 35.0, fontsize: 25.0),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.blue,
                    size: 30,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Row(
              children: [
                Text(name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23)),
                Icon(Icons.keyboard_arrow_up)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(email,
                style: TextStyle(color: Colors.black, fontSize: 19)),
          )
        ],
      ),
    ),
  );
}
