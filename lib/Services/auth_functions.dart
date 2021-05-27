import 'dart:async';
import 'package:Liveasy/getxcontrollers/getx_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';

class AuthFunctions {
  TimerController timerController = TimerController();
  HudController hudController = Get.put(HudController());
  AuthControllers authController = Get.put(AuthControllers());

  verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        // forceResendingToken: Obx(()  => authController.forceResendingToken.value ) ,
        forceResendingToken: authController.test.value,
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential result =
              await FirebaseAuth.instance.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {
            print(user.uid);
          }
          // timer.cancel();
          timerController.cancelTimer();
          print('hud false due to verificationCompleted');
          hudController.updateHudController(false);

          Get.offAll(() => Demo());
        },
        verificationFailed: (FirebaseAuthException e) {
          print('hud false due to verificationFailed');
          hudController.updateHudController(false);

          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          // setState(() {
          //   _forceResendingToken = resendToken;
          //   _verificationCode = verficationId;
          // });
          authController.updateForceResendingToken(resendToken);
          authController.updateVerificationCode(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // if (mounted) {
          //   setState(() {
          //     // closes the loading screen after 60 seconds in autoverfii doesnt work .. works fine.
          //     print('hud false due to codeAutoRetrievalTimeout');
          //     hudController.updateHudController(false);
          //     // _verificationCode = verificationId;
          //     authController.updateVerificationCode(verficationId);
          //   });
          hudController.updateHudController(false);
          authController.updateVerificationCode(verificationId);
        },
        // },
        timeout: Duration(seconds: 60));
  }

  void manualVerification(String smsCode) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: authController.verificationcode.value,
              smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          print('hud false due to try in manual verification');
          hudController.updateHudController(false);

          Get.offAll(() => Demo());
        }
      });
    } catch (e) {
      // FocusScope.of(context).unfocus();

      print('hud false due to catch in manual verification');
      hudController.updateHudController(false);

      Get.snackbar('Invalid Otp', 'Please Enter the correct OTP',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }
}
