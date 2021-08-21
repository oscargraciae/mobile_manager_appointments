import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/modules/services/new_service/new_service_controller.dart';
import 'package:reserly_manager/modules/services/new_service/widgets/times_view.dart';

import 'package:reserly_manager/utils/minutes_to_hour.dart';
import 'package:reserly_manager/widgets/Button.dart';
import 'package:reserly_manager/widgets/InputField.dart';

class NewServicePage extends StatelessWidget {
  NewServicePage({Key? key}) : super(key: key);

  final controller = Get.put(NewServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo servicio'),
        centerTitle: false,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    InputField(
                      label: 'Nombre',
                      controller: controller.nameCtrl,
                      validator: (value) {
                        if (value == '') {
                          return 'Campo vacio';
                        }
                      },
                      // onChanged: (value) => controller.name.value = value
                    ),
                    SizedBox(height: 12.0),
                    InputField(
                      label: 'Precio',
                      controller: controller.priceCtrl,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == '') {
                          return 'Campo vacio';
                        }
                      },
                      // onChanged: (value) => controller.price.value = double.parse(value), keyboardType: TextInputType.number
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        color: kInputColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xFFDDDDDD)),
                      ),
                      child: ListTile(
                        title: Text(controller.time.value != 0 ? minutesToHour(controller.time.value) : 'Tiempo'),
                        onTap: () async {
                          var data = await Get.to(() => TimeView(), transition: Transition.downToUp);
                          controller.time.value = data;
                        },
                        trailing: Icon(Icons.arrow_drop_down),
                      ),
                    )
                  ],
                ),
              ),
              Button(
                text: 'Guardar',
                onPressed: () => controller.createService(),
                color: kPrimaryColor,
                isLoading: controller.isLoading.value,
                // isDisabled: controller.formKey.currentState!.validate(),
              )
            ],
          ),
        ),
      ))
    );
  }
}
