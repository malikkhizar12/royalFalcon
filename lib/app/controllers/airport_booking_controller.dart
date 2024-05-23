import 'package:get/get.dart';

class AirportBookingsController extends GetxController {
  var isDubaiActive = true.obs;

  void toggleActive(bool isDubai) {
    isDubaiActive.value = isDubai;
  }

}
