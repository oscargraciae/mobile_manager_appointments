import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:reserly_manager/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void goSignup() {
    Get.toNamed('/signup');
  }

  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      isLoading(true);
      UserResponse response = await UserService().login(usernameCtrl.text.trim(), passwordCtrl.text);
      if (!response.success) {
          Get.snackbar(
            'Opps!',
            'Error de auth',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black,
            colorText: Colors.white,
            icon: Icon(Icons.cancel_outlined, color: Colors.white,),
          );
      } else {
        Get.offAllNamed('/home');
      }
      isLoading(false);
    }
  }

  void logout() async {
    GetStorage box = GetStorage();
    box.remove('qid');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('qid');
  }
}
