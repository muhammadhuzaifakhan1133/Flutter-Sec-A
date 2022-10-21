import 'package:flutter/material.dart';

Row topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi Hafiz 👋",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 15),
          Row(children: const [
            Text(
              "Let's find Your ",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Course!",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ]),
        ],
      ),
      Row(
        children: [
          Icon(Icons.shopping_basket_outlined),
          SizedBox(width: 20),
          Icon(Icons.notifications_none_outlined),
        ],
      )
    ],
  );
}
