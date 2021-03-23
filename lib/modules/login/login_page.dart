import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/widgets/InputField.dart';

import 'login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.0),
                    Image(
                      image: AssetImage('images/reserly-logo.png'),
                      width: 200.0,
                    ),
                    SizedBox(height: 28.0),
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                        'Recibe reservaciones online y gestiona la agenda de tu negocio.',
                        style: TextStyle(),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                  alignment: Alignment.center,

                  // decoration: BoxDecoration(color: Colors.red),
                  child: Obx(() {
                    if (loginController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else return Form(
                      key: loginController.formKey,
                      child: Column(
                        children: [
                          InputField(
                            label: 'Correo eletrónico',
                            hintText: "Correo electrónico",
                            controller: loginController.usernameCtrl,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16.0),
                          InputFieldPassword(
                            label: 'Contraseña',
                            controller: loginController.passwordCtrl,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: kPrimaryColor,
                              child: Text('INICIAR SESIÓN'),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              onPressed: () {
                                loginController.handleLogin();
                              },
                            ),
                          ),
                          // Container(
                          //   alignment: Alignment.centerRight,
                          //   child: FlatButton(
                          //     child: Text('¿Olvidaste tu contraseña?'),
                          //     onPressed: () {},
                          //   ),
                          // )
                        ],
                      ),
                    );
                  })
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(color: Colors.red),
              //   alignment: Alignment.bottomCenter,
              //   child: FlatButton(
              //     child: Text('Cerrar sesion'),
              //     onPressed: () => loginController.logout(),
              //   ),
              // ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: FlatButton(
              //     child: Text('¿No tienes cuenta? Registrate'),
              //     onPressed: () => loginController.goSignup(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _inputField() {
  //   return (TextField(
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //       hintText: 'Correo eletrónico',
  //       labelText: 'Correo eletrónico',
  //       // suffixIcon: Icon(Icons.alternate_email_outlined),
  //     ),
  //   ));
  // }

  // Widget _inputPasswordField() {
  //   return (TextField(
  //     obscureText: true,
  //     decoration: InputDecoration(
  //       hintText: 'Contraseña',
  //       labelText: 'Contraseña',
  //       // suffixIcon: Icon(Icons.lock),
  //     ),
  //   ));
  // }
}
