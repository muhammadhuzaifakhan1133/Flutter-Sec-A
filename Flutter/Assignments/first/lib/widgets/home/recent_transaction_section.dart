import 'package:flutter/material.dart';

recentTransactionSection() {
  return Column(
    children: [
      Row(
        children: [Text("Recent Transactions"), Container()],
      ),
      Row(
        children: [
          CircleAvatar(),
          CircleAvatar(),
          CircleAvatar(),
          CircleAvatar(),
          CircleAvatar(),
        ],
      )
    ],
  );
}
