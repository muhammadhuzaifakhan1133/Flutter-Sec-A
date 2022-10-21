import 'package:flutter/material.dart';

Widget iconForHome({required IconData icon, required String label}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Icon(
                icon,
                color: Colors.teal,
              ),
            ),
          ),
        ),
        Text(label)
      ],
    ),
  );
}
