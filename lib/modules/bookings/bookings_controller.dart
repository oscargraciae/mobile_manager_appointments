import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/booking.dart';
import 'package:reserly_manager/services/booking_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingsController extends GetxController {
  var isLoading = true.obs;
  List<Booking> bookings = [];
  List<Booking> bookingsPending = [];

  @override
  void onReady() {
    print('CARGANDO RESERVACIONES------>');
    fetchBookings();
    super.onReady();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('qid');
    Get.offAllNamed('/landing');
  }

  void fetchBookings() async {
    isLoading(true);
    // var responsePending = await BookingService.getAll(status: 1, endDate: DateTime.now());
    var response = await BookingService.getAll(status: 2, endDate: DateTime.now());
    bookings.addAll(response.bookings);
    // bookingsPending.addAll(responsePending.bookings);
    isLoading(false);
  }
}