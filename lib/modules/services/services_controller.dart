import 'package:get/get.dart';
import 'package:reserly_manager/models/service.dart';
import 'package:reserly_manager/services/services_service.dart';

class ServicesController extends GetxController {

  var isLoading = true.obs;
  RxList<Service> services = RxList();

  @override
  void onReady() {
    super.onReady();
    loadService();
  }

  void loadService() async {
    ServiceResponse response = await new ServicesService().getAll();
    if (response.success) {
      services.value = response.services.obs;
    }
    isLoading(false);
  }

  void delete(int id) async {
    await new ServicesService().delete(id);
    loadService();
  }
}