import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes de cuenta'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
