import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/services/booking_service.dart';

class BookingDetailController extends GetxController {
  // final booking = Booking().obs;
  late Rx<Booking> booking;
  RxBool isLoading = true.obs;

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
      fetchBooking(id);
    }
    isLoading(false);
  }
  void toCancel(int id) async {
    isLoading(true);
    var response = await BookingService.toCancel(id);
    if(response['success']) {
      fetchBooking(id);
    }
    isLoading(false);
  }

  void fetchBooking(int id) async {
    BookingResponse response = await BookingService.get(id);
    if (response.booking != null) {
      booking.value = response.booking as Booking;
    }
    isLoading(false);
  }
}