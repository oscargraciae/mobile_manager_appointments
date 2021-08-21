import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_page.dart';
import 'package:reserly_manager/services/user_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void openUrlTerms() {
    _launchURL('https://reserly.mx/terminos-y-condiciones');
  }

  void openUrlPolicity() {
    _launchURL('https://reserly.mx/aviso-de-privacidad');
  }

  void createAccount() async {
    if (formKey.currentState!.validate()) {
      isLoading(true);
      UserResponse response = await UserService().create(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text,
        firstName: firstNameCtrl.text.trim(),
        lastName: lastNameCtrl.text.trim()
      );
      if (response.success) {
        Get.offAllNamed('/onboarding');
        Get.offAll(OnBoardingPage());
      } else {
        Get.snackbar('Opps!', response.message!);
      }
    }
    isLoading(false);
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
