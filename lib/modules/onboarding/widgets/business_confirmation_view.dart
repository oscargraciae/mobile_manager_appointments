import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_controller.dart';
import 'package:reserly_manager/widgets/Button.dart';

class BusinessConfirmationView extends StatelessWidget {
  BusinessConfirmationView({Key? key}) : super(key: key);

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Flexible(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.check_circle, color: kPrimaryColor, size: 120),
               ],
             ),
           ),
           Flexible(child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Text(
                 'Completado',
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                 textAlign: TextAlign.center,
               ),
               SizedBox(height: 24),
               Text(
                 'Toda la información registrada anteriormente puede ser modificada desde la pagina de configuración.',
                 textAlign: TextAlign.center,
               ),
               Spacer(),
               Button(text: 'Guardar', onPressed: () => controller.createBusiness(), color: kPrimaryColor),
             ],
           )),
         ],
       ),
    );
  }
}
