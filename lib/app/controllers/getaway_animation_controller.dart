import 'package:get/get.dart';

class GetawayAnimationController extends GetxController {
  var myAnimation = false.obs;

  void startAnimation() {
    myAnimation.value = true;
  }
}
