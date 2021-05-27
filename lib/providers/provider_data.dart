import 'package:flutter/material.dart';

class OTPScreenProviderData with ChangeNotifier {
  bool hudController = false;
  String verificationCode = '';
  int forceResendingToken = 0;

  void updateHudController(bool value) {
    hudController = value;
    notifyListeners();
  }

  void updateVerificationCode(String value) {
    verificationCode = value;
    notifyListeners();
  }

  void updateForceResendingToken(int value) {
    forceResendingToken = value;
    notifyListeners();
  }  
}
