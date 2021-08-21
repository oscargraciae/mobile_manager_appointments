import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final onPressed;
  final bool isDisabled;
  final bool isLoading;

  const Button({ Key? key, required this.text, required this.onPressed, this.color, this.textColor, this.isDisabled = false, this.isLoading = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: isLoading ? SizedBox(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 1, ), height: 20, width: 20,) : Text(text, style: TextStyle(color: textColor)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          primary: !isDisabled ? color : Colors.grey.shade200,
          elevation: 0,
        ),
    );
  }
}
