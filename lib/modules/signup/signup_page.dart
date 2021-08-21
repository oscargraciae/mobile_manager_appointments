import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/signup/signup_controller.dart';
import 'package:reserly_manager/widgets/Button.dart';
import 'package:reserly_manager/widgets/InputField.dart';
import 'package:url_launcher/url_launcher.dart';



class SignupPage extends StatelessWidget {
  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear cuenta'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView (
          reverse: true,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Registrate gratis.',
                    style: TextStyle(),
                    textAlign: TextAlign.center
                  ),
                  SizedBox(height: 24.0),
                  Obx(() {
                    if (signupController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else return Form(
                      key: signupController.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Flexible(child: InputField(label: 'Nombre', controller: signupController.firstNameCtrl, textCapitalization: TextCapitalization.words)),
                              SizedBox(width: 16.0),
                              Flexible(child: InputField(label: 'Apellido', controller: signupController.lastNameCtrl, textCapitalization: TextCapitalization.words)),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          InputField(label: 'Correo eletrónico', keyboardType: TextInputType.emailAddress, controller: signupController.emailCtrl),
                          SizedBox(height: 12.0),
                          InputField(label: 'Contraseña', controller: signupController.passwordCtrl, obscureText: true),
                          SizedBox(height: 36.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Button(text: 'Crear cuenta', onPressed: () => signupController.createAccount(), color: kPrimaryColor),
                              SizedBox(height: 12.0),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(text: 'Al registrarte, confirmas que aceptas los'),
                                      TextSpan(text: 'Términos y condiciones', style: TextStyle(color: kPrimaryColor), recognizer: new TapGestureRecognizer()..onTap = () => signupController.openUrlTerms()),
                                      TextSpan(text: ' y la '),
                                      TextSpan(text: 'Política de privacidad', style: TextStyle(color: kPrimaryColor), recognizer: new TapGestureRecognizer()..onTap = () => signupController.openUrlPolicity())
                                    ]
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}