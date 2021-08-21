import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/modules/services/services_controller.dart';
import 'package:reserly_manager/services/services_service.dart';

class NewServiceController extends GetxController {
  int _id = 0;

  var isLoading = false.obs;
  var time = 0.obs;
  // var name = ''.obs;
  // var price = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments.id != null) {
      _id = Get.arguments.id;
      nameCtrl.text = Get.arguments.name;
      priceCtrl.text = Get.arguments.price;
      time.value = Get.arguments.time;
    }
  }

  final serviceCtrl = Get.find<ServicesController>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();

  // final formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  void createService() async {
    if (formKey.currentState!.validate() && time.value != 0) {
      isLoading(true);
      bool isCreated = false;
      if (_id != 0) {
        print('UPDATE SERVICE');
        isCreated = await new ServicesService().update(id: _id, name: nameCtrl.text, time: time.value, price: double.parse(priceCtrl.text ));
      } else {
        print('CREATE SERVICE');
        isCreated = await new ServicesService().create(name: nameCtrl.text, time: time.value, price: double.parse(priceCtrl.text));
      }

      if (isCreated) {
        serviceCtrl.loadService();
        isLoading(false);
        Get.back();
      }
    }
  }
}