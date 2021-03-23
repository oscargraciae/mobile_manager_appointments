import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String label;
  final ValueChanged<String> onChanged;
  final controller;

  const InputField({Key key, this.hintText, @required this.label, @required this.onChanged, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      controller: controller,
      validator: (value){
        if(value.isEmpty){
          return 'Campo requerido.';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText != null ? hintText : '',
        labelText: label,
        // suffixIcon: Icon(Icons.alternate_email_outlined),
      ),
    ));
  }
}

class InputFieldPassword extends StatelessWidget {
  final String hintText;
  final String label;
  final ValueChanged<String> onChanged;
  final controller;

  const InputFieldPassword({Key key, this.hintText, @required this.label, @required this.onChanged, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      obscureText: true,
      controller: controller,
      validator: (value){
        if(value.isEmpty){
          return 'Contraseña es requerido.';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        // suffixIcon: Icon(Icons.lock),
      ),
    ));
  }
}