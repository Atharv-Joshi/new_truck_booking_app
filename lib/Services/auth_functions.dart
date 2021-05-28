import 'dart:async';
import 'package:Liveasy/screens/new_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';
import 'package:Liveasy/getxcontrollers/hud_controller.dart';
import 'package:http/http.dart';

class AuthService {
  HudController hudController = Get.put(HudController());
  void manualVerification({String verificationId, String smsCode}) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          print('hud false due to try in manual verification');
          // hudController.updateHudController(false);
          hudController.updateHud(false);
          Get.offAll(() => Demo());
        }
      });
    } catch (e) {
      // FocusScope.of(context).unfocus();

      print('hud false due to catch in manual verification');


      hudController.updateHud(false);
      // Get.to(() => NewLoginScreen());

      Get.snackbar('Invalid Otp', 'Please Enter the correct OTP',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }
}
