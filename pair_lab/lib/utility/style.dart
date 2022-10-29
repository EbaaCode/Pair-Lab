import 'package:flutter/material.dart';

themeColor(email) {
  Color primaryColor = Colors.grey;

  if (email != null) {
    if (email.contains("red")) {
      primaryColor = Colors.red;
    } else if (email.contains("blue")) {
      primaryColor = Colors.blue;
    } else if (email.contains("green")) {
      primaryColor = Colors.green;
    }
  }
  return primaryColor;
}
