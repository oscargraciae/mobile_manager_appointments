import 'package:flutter/material.dart';
import 'package:reserly_manager/config/theme.dart';
// import 'package:reserly_manager/controllers/home_controller.dart';
import 'package:get/get.dart';

import 'package:reserly_manager/modules/bookings/bookings_page.dart';
import 'package:reserly_manager/modules/calendar/calendar_page.dart';
import 'package:reserly_manager/modules/home/home_controller.dart';
import 'package:reserly_manager/modules/home/nav_controller.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_page.dart';
import 'package:reserly_manager/modules/services/services_page.dart';
import 'package:reserly_manager/modules/settings/settings_page.dart';

class HomePage extends StatelessWidget {

  final HomeController homeCtrl = Get.put(HomeController());
  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          // child: Obx(() => PagesManager( currentPage: controller.selectedIndex, )),
          child: Obx(() {
            switch (controller.selectedIndex) {
              case 0:
                return CalendarPage();
              case 1:
                return BookingsPage();
              case 2:
                return ServicesPage();
              case 3:
                return SettingsPage();
              default:
                return BookingsPage();
            }
          }),
        ),
        bottomNavigationBar: GetBuilder<NavController>(
            init: NavController(),
            builder: (controller) {
              return Obx(() => BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendario'),
                      BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Solicitudes'),
                      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Servicios'),
                      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
                    ],
                    backgroundColor: kPrimaryLight,
                    selectedItemColor: kPrimaryColor,
                    unselectedItemColor: Colors.black,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    iconSize: 20,
                    type: BottomNavigationBarType.fixed,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    selectedLabelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    currentIndex: controller.selectedIndex,
                    onTap: (index) {
                      // print(controller.selectedIndex);
                      // controller.selectedIndex = index;
                      controller.selectedIndex = index;
                    },
                  ));
            }));
  }
}
