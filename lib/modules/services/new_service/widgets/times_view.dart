import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/utils/minutes_to_hour.dart';

class TimeView extends StatelessWidget {
  TimeView({Key? key}) : super(key: key);

  List<int> times = [15, 30, 45, 60, 75, 90, 105, 120];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiempo'),
      ),
      body: ListView.separated(
        itemCount: times.length,
        itemBuilder: (context, index) => ListTile(title: Text(minutesToHour(times[index]).toString()), onTap: () {
          print(times[index]);
          Get.back(result: times[index]);
        }),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
