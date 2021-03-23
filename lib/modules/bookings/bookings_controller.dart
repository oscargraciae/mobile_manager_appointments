import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/services/booking_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingsController extends GetxController {
  var isLoading = true.obs;
  var bookings = List<Booking>().obs;
  var bookingsPending = List<Booking>().obs;

  @override
  void onReady() {
    fetchBookings();
    super.onReady();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('qid');
    Get.offAllNamed('/login');
  }

  void fetchBookings() async {
    isLoading(true);
    var responsePending = await BookingService.getAll(status: 1, endDate: DateTime.now());
    var response = await BookingService.getAll(status: 2, endDate: DateTime.now());
    if (response.success) {
      bookings.value = response.bookings;
      bookingsPending.value = responsePending.bookings;
      // bookings = response.bookings;
    }
    isLoading(false);
  }

  Future<Null> relaodBookings() async {
    isLoading(true);
    var responsePending = await BookingService.getAll(status: 1, endDate: DateTime.now());
    var response = await BookingService.getAll(status: 2, endDate: DateTime.now());
    if (response.success) {
      bookings.value = response.bookings;
      bookingsPending.value = responsePending.bookings;
      // bookings = response.bookings;
    }
    isLoading(false);
  }
}