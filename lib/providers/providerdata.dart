import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  bool inputControllerLengthCheck = false;
  dynamic buttonColor = MaterialStateProperty.all<Color>(Colors.grey);
  String smsCode = '';

  String phoneController = '';

  void updatePhoneController(String value) {
    phoneController = value;
    print(phoneController);
    notifyListeners();
  }

  void updateInputControllerLengthCheck(bool value) {
    inputControllerLengthCheck = value;
    notifyListeners();
  }

  void updateButtonColor(dynamic value) {
    buttonColor = value;
    notifyListeners();
  }

  void updateSmsCode(value) {
    smsCode = value;
    notifyListeners();
  }

  void clearall() {
    // phoneController = '';
    inputControllerLengthCheck = false;
    buttonColor = MaterialStateProperty.all<Color>(Colors.grey);
    smsCode = '';
    notifyListeners();
  }
}
