import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:reserly_manager/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _loadMe();
  }

  void _loadMe() async {
    UserResponse response = await UserService().getMe();

    if (!response.success || response.user == null) {
      logout();
      return;
    }

    User user = response.user!;
    if (user.businessUser == null) Get.offAllNamed('/onboarding');
    else {
      // SharedPreferences _pref = await SharedPreferences.getInstance();
      // _pref.setString("businessId", );

      GetStorage box = GetStorage();
      box.write('businessId', user.businessUser!.businessId.toString());
    }
  }

  logout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('qid');

    GetStorage box = GetStorage();
    box.remove('qid');
    Get.offAllNamed('/landing');
  }
}