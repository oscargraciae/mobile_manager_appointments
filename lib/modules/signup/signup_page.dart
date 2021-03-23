import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';

class SignupPage extends StatelessWidget {
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
                    SizedBox(height: 20.0),
                    Text(
                      'Join us to start selling',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Text(
                        'Discover your perfect university',
                        style: TextStyle(),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                child: Column(
                  children: [
                    // inputField( onChanged: () {}, label: 'Nombre'),
                    SizedBox(height: 10.0),
                    // inputField( onChanged: () {}, label: 'Apellido'),
                    SizedBox(height: 10.0),
                    // inputField( onChanged: () {}, label: 'Correo eletrónico'),
                    SizedBox(height: 10.0),
                    // inputPasswordField(),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: kPrimaryColor,
                        child: Text('CREAR CUENTA'),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    child: Text('Regresar a iniciar sesióin'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}