import 'package:first/widgets/home/square_section.dart';
import 'package:flutter/material.dart';

ticketBookingSection() {
  return squareSectionWidget(title: "Ticket Booking", icons: [
    Icons.movie,
    Icons.train,
    Icons.bus_alert,
    Icons.flight,
    Icons.car_rental
  ], labels: [
    "Movies",
    "Trains",
    "Bus",
    "Flights",
    "Car"
  ]);
}
