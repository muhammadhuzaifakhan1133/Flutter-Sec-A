import 'package:flutter/material.dart';

IconData suffixIcon(bool obscure) {
  if (obscure) {
    return Icons.visibility_off;
  } else {
    return Icons.visibility;
  }
}
