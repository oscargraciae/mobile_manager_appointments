import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/styles/text_style.dart';
import 'package:reserly_manager/utils/format_date.dart';
import 'package:reserly_manager/utils/minutes_to_hour.dart';
import 'package:reserly_manager/utils/status_colors.dart';

class BookingTile extends StatelessWidget {
  final Booking booking;

  const BookingTile({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 4.0, color: statusColor(booking.bookingStatusId))),
      ),
      child: ListTile(
        onTap: () => Get.toNamed('/booking', arguments: booking),
        tileColor: Colors.white,
        title: Text('${booking.customer.firstName} ${booking.customer.lastName}', style: tileTitle, maxLines: 1,),
        subtitle: Text(formatDateLG(booking.bookingDate), style: tileSubtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${minutesToHour(booking.totalTime)}', style: TextStyle(fontWeight: FontWeight.w600),),
            Text('\$${booking.totalPrice}MX', style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}
