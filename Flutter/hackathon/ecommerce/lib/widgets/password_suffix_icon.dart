import 'package:flutter/material.dart';

IconData passwordSuffixIcon(bool obscureText) {
  if (obscureText) {
    return Icons.visibility_off;
  } else {
    return Icons.visibility;
  }
}
