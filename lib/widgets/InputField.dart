import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';

Widget _containerInput({Key? key, required child}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
    decoration: BoxDecoration(
        color: kInputColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xFFDDDDDD)),
    ),
    child: child,
  );
}


class InputField extends StatelessWidget {
  final String? hintText;
  final String label;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final controller;
  final FormFieldValidator<String>? validator;

  const InputField({Key? key, this.hintText, required this.label, this.onChanged, this.keyboardType, this.controller, this.validator, this.textCapitalization = TextCapitalization.none, this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _containerInput(
      child: TextFormField(
        keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          labelText: label,
          contentPadding: EdgeInsets.all(0.0),
          border: InputBorder.none,
          // suffixIcon: Icon(Icons.alternate_email_outlined),
        ),
      ));
  }
}
