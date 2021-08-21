import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';

Color statusColor(int id) {
  switch (id) {
    case 1:
      return Colors.amber;
    case 2:
      return kPrimaryColor;
    case 3:
      return Colors.red;
    default:
      return kPrimaryColor;
  }
}
