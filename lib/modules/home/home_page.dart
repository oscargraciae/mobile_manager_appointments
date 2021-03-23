import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';
// import 'package:reserly_manager/controllers/home_controller.dart';
import 'package:get/get.dart';

import 'package:reserly_manager/modules/bookings/bookings_page.dart';
import 'package:reserly_manager/modules/calendar/calendar_page.dart';
import 'package:reserly_manager/modules/home/nav_controller.dart';


class HomePage extends StatelessWidget {
  // final HomeController c = Get.put(HomeController());
  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Obx(() => PagesManager( currentPage: controller.selectedIndex, )),
        child: Obx(() {
          switch (controller.selectedIndex) {
            case 0: return BookingsPage();
            case 1: return BookingsPage();
            case 2: return CalendarPage();
            default: return BookingsPage();
          }
        }),
      ),
      // bottomNavigationBar: GetBuilder<NavController>(
      //   init: NavController(),
      //   builder: (controller) {
      //     return Obx(() => BottomNavigationBar(
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.list),
      //           label: 'Reservaciones'
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.calendar_today),
      //           label: 'Calendario',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.settings),
      //           label: 'Configuraciones',
      //         ),
      //       ],
      //       backgroundColor: Colors.white,
      //       selectedItemColor: kPrimaryColor,
      //       unselectedItemColor: Colors.grey,
      //       showUnselectedLabels: false,
      //       showSelectedLabels: false,
      //       type: BottomNavigationBarType.fixed,
      //       currentIndex: controller.selectedIndex,
      //       onTap: (index) {
      //         // print(controller.selectedIndex);
      //         // controller.selectedIndex = index;
      //         controller.selectedIndex = index;
      //       },
      //     ));
      //   }
      // )
    );
  }
}