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
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              bookingsCtl.logout();
            },
          ),
        ],
        backgroundColor: kSurfaceColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     color: kSurfaceColor,
          //   ),
          //   child: SafeArea(
          //     child: Padding(
          //       padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             new DateFormat('d MMMM y').format(new DateTime.now()),
          //             style: TextStyle(
          //               fontWeight: FontWeight.w300,
          //               fontSize: 14,
          //               color: Colors.white,
          //             ),
          //           ),
          //           Text(
          //             'Hola, Oscar',
          //             style: TextStyle(
          //               fontWeight: FontWeight.w600,
          //               fontSize: 20,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() {
                if (bookingsCtl.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                return RefreshIndicator(
                  onRefresh: bookingsCtl.relaodBookings,
                  child: ListView(
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
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
