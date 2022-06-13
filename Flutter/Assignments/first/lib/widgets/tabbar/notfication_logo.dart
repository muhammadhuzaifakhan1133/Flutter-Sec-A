import 'package:first/widgets/buttons/button.dart';
import 'package:first/screens/notifications.dart';
import 'package:flutter/material.dart';

notificationLogo(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, right: 4),
    child: InkWell(
      onTap: () {
        NavigateTo(context, Notifications());
      },
      child: Icon(
        Icons.circle_notifications,
        color: Color(0xff343645),
        size: 50,
      ),
    ),
  );
}
