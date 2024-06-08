import 'package:get/get.dart';

class RidesAnimationController extends GetxController {
  var myAnimation = false.obs;

  void startAnimation() {
    myAnimation.value = true;
  }
}
