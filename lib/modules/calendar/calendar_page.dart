import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Calendario'),
      ),
      body: Center(
        child: Text('Calendario'),
      ),
    );
  }
}