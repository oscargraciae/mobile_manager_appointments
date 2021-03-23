import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/services/booking_service.dart';

class BookingDetailController extends GetxController {
  var booking = Booking().obs;
  var isLoading = true.obs;

  @override
  void onReady() {
    int id = Get.arguments.id;
    fetchBooking(id);
    super.onReady();
  }

  void toAccept(int id) async {
    isLoading(true);
    var response = await BookingService.toAccept(id);
    if(response['success']) {
      // Get.snackbar('Aviso', 'Servicio aceptado.');
      fetchBooking(id);
    }
    isLoading(false);
  }
  void toCancel(int id) async {
    isLoading(true);
    var response = await BookingService.toCancel(id);
    if(response['success']) {
      // Get.snackbar('Aviso', 'Servicio rechazado.');
      fetchBooking(id);
    }
    isLoading(false);
  }

  void fetchBooking(int id) async {
    var response = await BookingService.get(id);
    if (response.success) {
      booking.value = response.booking;
    }
    isLoading(false);
  }
}