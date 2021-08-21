import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/widgets/Button.dart';
import 'package:reserly_manager/widgets/InputField.dart';

import 'login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión',),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              Text(
                'Ingresa tus datos de acceso para administrar tu cuenta.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(() {
                    if (loginController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else return Form(
                      key: loginController.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputField(
                            label: 'Correo eletrónico',
                            hintText: "Correo electrónico",
                            controller: loginController.usernameCtrl,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16.0),
                          InputField(
                            label: 'Contraseña',
                            controller: loginController.passwordCtrl,
                            obscureText: true,
                            onChanged: (value) {},
                          ),
                          Spacer(),
                          Button(
                            text: 'Iniciar sesión',
                            onPressed: () => loginController.handleLogin(),
                            color: kPrimaryColor,
                          )
                        ],
                      ),
                    );
                  })
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
