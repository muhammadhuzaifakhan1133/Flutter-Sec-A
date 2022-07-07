import 'package:flutter/material.dart';

IconData suffixIcon(bool obscure) {
  if (obscure) {
    return Icons.visibility;
  } else {
    return Icons.visibility_off;
  }
}
