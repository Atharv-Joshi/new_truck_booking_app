import 'package:get/get.dart';

class HudController extends GetxController {
  RxBool hudController = false.obs;

  void updateHudController(bool value) {
    hudController.value = value;
  }
}



class AuthControllers extends GetxController {
  RxString verificationcode = ''.obs;
  RxInt forceResendingToken = 0.obs;
  var test = 0.obs;

  void updateVerificationCode(String value) {
    verificationcode.value = value;
  }

  void updateForceResendingToken(int value) {
    forceResendingToken.value = value;
  }
}
