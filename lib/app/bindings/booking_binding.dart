import 'package:get/get.dart';
import '../controllers/booking_list_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingListController());
    // Add other dependencies here if needed
  }
}