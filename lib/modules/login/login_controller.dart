import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:reserly_manager/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  
  final formKey = GlobalKey<FormState>();

  goSignup() {
    Get.toNamed('/signup');
  }

  handleLogin() async {
    if (formKey.currentState.validate()) {
      isLoading(true);
      UserResponse response = await UserService().login(usernameCtrl.text, passwordCtrl.text);
      print('Respuesta de Login');
      if (!response.success) {
        Get.snackbar('Error', response.message);
      } else {
        // Get.snackbar('Conexion exitosa', response.user.email, backgroundColor: Colors.green);
        Get.offNamed('/home');
      }
      isLoading(false);
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('qid');
  }


  // @override
  // void onInit() async {
  //   super.onInit();
  //   UserResponse customers = await UserService().getCustomers();
  //   print('Clientes');
  //   print(customers);
  // }

}