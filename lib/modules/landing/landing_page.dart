import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/widgets/Button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage('images/reserly-logo.png'),
                    width: 300,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Recibe reservaciones online y gestiona la agenda de tu negocio.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 28.0),
                      Text(
                        'Gratis. Disponible las 24 horas. \n Más clientes. Menos distracciones.',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.0),
                      Button(text: 'Crear cuenta', onPressed: () { Get.toNamed('/signup'); }, color: kPrimaryColor, textColor: Colors.white,),
                      SizedBox(height: 12.0),
                      Button(text: 'Iniciar sesión', onPressed: () { Get.toNamed('/login'); }, color: Colors.white, textColor: Colors.black, ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
