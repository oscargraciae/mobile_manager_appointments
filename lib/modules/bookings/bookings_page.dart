import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/bookings/bookings_controller.dart';
import 'package:reserly_manager/modules/bookings/widgets/pending_booking.dart';
import 'package:reserly_manager/styles/text_style.dart';

// 21792b91-5514-4525-8925-fef85c09b43a

class BookingsPage extends StatelessWidget {
  final BookingsController bookingsCtl = Get.put(BookingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('d MMMM y').format(new DateTime.now())),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              bookingsCtl.logout();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() {
                if (bookingsCtl.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                return ListView(
                  children: [
                    Row(
                      children: [
                        Text('Solicitudes', style: subtitlePage),
                        Container(
                          decoration: BoxDecoration(
                              color: kaccentColor, shape: BoxShape.circle),
                          margin: EdgeInsets.only(left: 8.0),
                          padding: EdgeInsets.all(8.0),
                          child: Text('${bookingsCtl.bookingsPending.length}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                    PendingBookings(bookings: bookingsCtl.bookingsPending),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text('Próximos servicios', style: subtitlePage),
                        Container(
                          decoration: BoxDecoration(
                              color: kaccentColor, shape: BoxShape.circle),
                          margin: EdgeInsets.only(left: 8.0),
                          padding: EdgeInsets.all(8.0),
                          child: Text('${bookingsCtl.bookings.length}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                    PendingBookings(bookings: bookingsCtl.bookings),
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
