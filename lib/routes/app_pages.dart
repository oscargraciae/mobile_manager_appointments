import 'package:get/route_manager.dart';
import 'package:reserly_manager/modules/booking/booking_detail_page.dart';
import 'package:reserly_manager/modules/home/home_page.dart';
import 'package:reserly_manager/modules/login/login_page.dart';
import 'package:reserly_manager/modules/signup/signup_page.dart';


class AppPages {
  
  static const INITIAL = '/loin';

  static final routes = [
    GetPage(
      name: '/login', 
      page:()=> LoginPage(),
    ),
    GetPage(
      name: '/signup', 
      page:()=> SignupPage(),
    ),
    GetPage(
      name: '/home', 
      page:()=> HomePage(),
    ),
    GetPage(
      name: '/booking', 
      page:()=> BookingDetailPage(),
    ),
  ];
}