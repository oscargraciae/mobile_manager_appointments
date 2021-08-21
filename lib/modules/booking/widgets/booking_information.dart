import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/styles/text_style.dart';

import 'package:reserly_manager/utils/format_date.dart';
import 'package:reserly_manager/utils/status_colors.dart';

class BookingInformation extends StatelessWidget {
  final Booking booking;

  const BookingInformation({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 20.0,
              color: kTextSecondaryColor,
            ),
            SizedBox(width: 12.0),
            Text('${formatDate(booking.bookingDate)}', style: valueLabel),
            Spacer(),
            Chip(
                label: Text(
                  '${booking.bookingStatus.name}',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: statusColor(booking.bookingStatusId))
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              size: 20.0,
              color: kTextSecondaryColor,
            ),
            SizedBox(width: 12.0),
            Text(
                '${formatDateHour(booking.bookingDate)} - ${finishTime(booking.bookingDate, booking.totalTime)}',
                style: valueLabel)
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.attach_money_outlined,
              size: 20.0,
              color: kTextSecondaryColor,
            ),
            SizedBox(width: 12.0),
            Text('\$${booking.totalPrice} MXN', style: valueLabel)
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.phone_android_outlined,
              size: 20.0,
              color: kTextSecondaryColor,
            ),
            SizedBox(width: 12.0),
            Text('${booking.customer.phone ?? '-'}', style: valueLabel)
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.notes_outlined,
              size: 20.0,
              color: kTextSecondaryColor,
            ),
            SizedBox(width: 12.0),
            Flexible(
              child: Text('${booking.message ?? '-'}', style: valueLabel)
            )
          ],
        ),
      ],
    );
  }
}
