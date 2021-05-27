import 'dart:async';
import 'package:Liveasy/screens/new_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';

class AuthService {
  void manualVerification({String verificationId, String smsCode}) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          print('hud false due to try in manual verification');
          // hudController.updateHudController(false);

          Get.offAll(() => Demo());
        }
      });
    } catch (e) {
      // FocusScope.of(context).unfocus();

      print('hud false due to catch in manual verification');
      // hudController.updateHudController(false);

// until hudcontroller is setup in a separate file rather than otpverification ,upon error in manual  verification control will be taken to loginscreen to remove the loading widget
      Get.to(() => NewLoginScreen());

      Get.snackbar('Invalid Otp', 'Please Enter the correct OTP',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }
}
