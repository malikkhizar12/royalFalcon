import 'package:get/get.dart';

class AirportAnimationController extends GetxController {
  RxBool myAnimation = false.obs;

  void startAnimation() {
    myAnimation.value = true;
  }

  @override
  void onClose() {
    myAnimation.close();
    super.onClose();
  }
}
