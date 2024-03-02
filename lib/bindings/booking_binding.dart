import 'package:get/get.dart';
import 'package:royal_falcon_limousine/controllers/booking_list_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingListController());
    // Add other dependencies here if needed
  }
}