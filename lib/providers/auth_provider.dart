import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String verificationId = '';
  int resendToken = 0;

  void updateVerificationId(String value) {
    verificationId = value;
    print(verificationId);
    notifyListeners();
  }

  void updateresendToken(int value) {
    resendToken = value;
    print(resendToken);
    notifyListeners();
  }
}
