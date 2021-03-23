import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/booking/booking_detail_controller.dart';

class BottomButtons extends StatelessWidget {
  final bookingCtl = Get.put(BookingDetailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(-1, 0), spreadRadius: 0, color: Colors.black.withOpacity(0.8),  blurRadius: 8),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              onPressed: () {
                bookingCtl.toCancel(bookingCtl.booking.value.id);
              },
              textColor: Colors.red,
              child: Text('RECHAZAR'),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  bookingCtl.toAccept(bookingCtl.booking.value.id);
                },
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text('ACEPTAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}