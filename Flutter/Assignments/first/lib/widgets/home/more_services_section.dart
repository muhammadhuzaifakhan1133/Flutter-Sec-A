import 'package:first/widgets/home/square_section.dart';
import 'package:flutter/material.dart';

moreServicesSection() {
  return squareSectionWidget(title: "More Services", icons: [
    Icons.bar_chart,
    Icons.percent,
    Icons.monitor_heart,
    Icons.car_crash
  ], labels: [
    "Invest",
    "Loans",
    "Insurance",
    "Fastag"
  ]);
}
