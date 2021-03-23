import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/booking/booking_detail_controller.dart';
import 'package:reserly_manager/modules/booking/widgets/booking_information.dart';
import 'package:reserly_manager/modules/booking/widgets/bottom_buttons.dart';
import 'package:reserly_manager/modules/booking/widgets/services_list.dart';

class BookingDetailPage extends StatelessWidget {
  final bookingCtl = Get.put(BookingDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        print('Estatus ${bookingCtl.booking.value.bookingStatusId}');
        if (bookingCtl.isLoading.value)
          return Center(child: CircularProgressIndicator());

        return Stack(
          children: [
            Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: kSurfaceColor,
                    floating: false,
                    stretch: false,
                    pinned: true,
                    expandedHeight: 120,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        '${bookingCtl.booking.value.customer.firstName} ${bookingCtl.booking.value.customer.lastName}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookingInformation(
                                booking: bookingCtl.booking.value,
                              ),
                              SizedBox(height: 28),
                              ServicesList(
                                  bookingServices:
                                      bookingCtl.booking.value.bookingService),
                              SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            if (bookingCtl.booking.value.bookingStatusId == 1)
              new Positioned(
                bottom: 0,
                child: BottomButtons(),
              ),
          ],
        );
      }),
      // bottomNavigationBar: Obx(() => bookingCtl.booking.value.bookingStatusId == 1 ? BottomButtons() : null),
    );
  }
}
