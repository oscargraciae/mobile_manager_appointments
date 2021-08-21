import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/models/Place.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_controller.dart';
import 'package:reserly_manager/widgets/Button.dart';
import 'package:reserly_manager/widgets/InputField.dart';

class BusinessAddressView extends StatelessWidget {
  BusinessAddressView({Key? key}) : super(key: key);

  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '¿Cual es la dirección de tu negocio?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              decoration: BoxDecoration(
                  color: kInputColor,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Dirección, calle y númerio',
                  suffixIcon: IconButton(icon: Icon(Icons.cancel_outlined), onPressed: () => controller.onCleanAddress()),
                ),
                controller: controller.addressCtrl,
                onChanged: controller.onChangeAddress,
              ),
            ),
            Expanded(
              child: Container(
                child: controller.isOpenAddressList.value ? ListView.separated(
                  itemCount: controller.predictions.length,
                  itemBuilder: (context, index) {
                    Prediction prediction = controller.predictions[index];
                    return ListTile(title: Text(prediction.description), onTap: () => controller.onSelectedAddress(prediction.placeId, prediction.description));
                  },
                  separatorBuilder: (context, i) => Divider(),
                ) : null,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (controller.addressMap.value.isNotEmpty) {
                  controller.goNext();
                }
              },
              child: Text('Siguiente'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                primary: controller.addressMap.value.isNotEmpty ? kPrimaryColor : Colors.grey.shade200,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
