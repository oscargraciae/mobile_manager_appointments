import 'package:flutter/material.dart';

class ButtonAppBar extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  ButtonAppBar({Key? key, required this.icon, required this.iconSize, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
      child: IconButton(onPressed: onPressed, icon: Icon(icon), iconSize: iconSize)
    );
  }
}
