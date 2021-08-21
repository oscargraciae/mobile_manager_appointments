import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_controller.dart';
import 'package:reserly_manager/widgets/InputField.dart';

class BusinessNameView extends StatelessWidget {
  BusinessNameView({Key? key}) : super(key: key);

  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Estás a un paso de comenzar a organizar tus citas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            InputField(
              label: 'Nombre del negocio',
              onChanged: (value) => controller.name.value = value,
              controller: controller.nameCtrl,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (controller.name.value.isNotEmpty) {
                  controller.goNext();
                }
              },
              child: Text('Siguiente'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                primary: controller.name.value.isNotEmpty ? kPrimaryColor : Colors.grey.shade200,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
