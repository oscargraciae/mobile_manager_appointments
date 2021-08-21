import 'package:get/route_manager.dart';
import 'package:reserly_manager/modules/home/home_page.dart';
import 'package:reserly_manager/modules/landing/landing_page.dart';
import 'package:reserly_manager/modules/login/login_page.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_page.dart';
import 'package:reserly_manager/modules/services/new_service/new_service_page.dart';
import 'package:reserly_manager/modules/signup/signup_page.dart';
import 'package:reserly_manager/routes/app_routes.dart';

class AppPages {
  static const INITIAL = '/landing';

  static final routes = [
    GetPage(
      name: AppRoutes.LANDING,
      page: () => LandingPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
      // middlewares: [
      //   MiddlewareAuth(),
      // ],
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnBoardingPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.NEW_SERVICE,
      page: () => NewServicePage(),
      transition: Transition.rightToLeft,
    ),
    // GetPage(
    //   name: AppRoutes.BOOKINS,
    //   page: () => BookingDetailPage(),
    // ),
  ];
}
