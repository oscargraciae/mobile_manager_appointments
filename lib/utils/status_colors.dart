import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';

Color statusColor(int id) {
  switch (id) {
    case 1:
      return Colors.amber[900];
    case 2:
      return kPrimaryColor;
    case 3:
      return Colors.red[700];
    default:
      return kPrimaryColor;
  }
}
