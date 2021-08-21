import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/modules/bookings/widgets/booking_tile.dart';
import 'package:reserly_manager/styles/text_style.dart';

class PendingBookings extends StatelessWidget {
  final List<Booking> bookings;

  const PendingBookings({Key? key, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Text('Solicitudes', style: subtitlePage),
        //     Container(
        //       decoration: BoxDecoration(color: kaccentColor, shape: BoxShape.circle),
        //       margin: EdgeInsets.only(left: 8.0),
        //       padding: EdgeInsets.all(8.0),
        //       child: Text('${bookings.length}',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 12,
        //           fontWeight: FontWeight.w700
        //         )
        //       ),
        //     )
        //   ],
        // ),
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            return BookingTile(booking: bookings[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 8.0);
          },
        ),
      ],
    );
  }
}
