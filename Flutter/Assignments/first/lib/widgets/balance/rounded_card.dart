import 'package:flutter/material.dart';

roundedCardWidget(
    {required String bank_name,
    required String account_no,
    required String amount,
    required Color color}) {
  Color text_color = Colors.white;
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 15,
      color: color,
      child: Container(
        width: 140,
        height: 98,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bank_name,
              style: TextStyle(
                  color: text_color, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              account_no,
              style: TextStyle(color: text_color, fontSize: 16),
            ),
            Text(
              amount,
              style: TextStyle(
                  color: text_color, fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
