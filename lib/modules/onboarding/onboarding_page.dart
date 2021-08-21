import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/modules/home/home_controller.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_controller.dart';
import 'package:reserly_manager/modules/onboarding/widgets/business_address_view.dart';
import 'package:reserly_manager/modules/onboarding/widgets/business_category_view.dart';
import 'package:reserly_manager/modules/onboarding/widgets/business_confirmation_view.dart';
import 'package:reserly_manager/modules/onboarding/widgets/business_name_view.dart';
import 'package:reserly_manager/modules/onboarding/widgets/business_service_view.dart';
import 'package:reserly_manager/widgets/Button.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  // final HomeController homeCtrl = Get.put(HomeController());
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => controller.goBackStep(),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.logout),
        //     onPressed: () {
        //       ctl.logout();
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.arrow_right_alt),
        //     onPressed: () => controller.goNext(),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Obx(() => PageView(
            controller: controller.pageController.value,
            physics: NeverScrollableScrollPhysics(),
            children: [
              BusinessNameView(),
              BusinessCategoryView(),
              BusinessAddressView(),
              BusinessConfirmationView(),
            ],
          )),
        ),
      ),
    );
  }
}
