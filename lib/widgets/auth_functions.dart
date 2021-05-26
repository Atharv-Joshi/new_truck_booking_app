// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// _verifyPhoneNumber( {BuildContext context ,int forceResendingToken , String phoneNumber , Timer timer , String verificationCode }) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         forceResendingToken: forceResendingToken,
//         // phoneNumber: '+91${widget.phoneNumber}',
//         phoneNumber: '+91$phoneNumber',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           UserCredential result =
//               await FirebaseAuth.instance.signInWithCredential(credential);
//           User user = result.user;
//           print(user);
//           print('Auto login successfull');
//           if (user != null) {
//             print(user.uid);
//           }
//           timer.cancel();
//           // Navigator.pop(context);
//           Navigator.pushReplacementNamed(context, '/demo');
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verficationId, int resendToken) {
//           setState(() {
//             forceResendingToken = resendToken;
//             verificationCode = verficationId;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 60));
//   }


//     void startTimer({int timeOnTimer , Timer timer , Color resendButtonColor}) {
//     timeOnTimer = 60;

//     //remove setstate if needed
//     if (timer != null) {
//       timer.cancel();
//     }
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (timeOnTimer > 0) {
//           timeOnTimer--;
//         } else {
//           timer.cancel();
//           resendButtonColor = const Color(0xff109E92);
//         }
//       });
//     });
//   }


//     void manualVerification({String verificationCode}) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithCredential(PhoneAuthProvider.credential(
//               verificationId: verificationCode, smsCode: _smsCode))
//           .then((value) async {
//         if (value.user != null) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => Demo()),
//               (route) => false);
//         }
//       });
//     } catch (e) {
//       FocusScope.of(context).unfocus();
//       _scaffoldkey.currentState
//           // ignore: deprecated_member_use
//           .showSnackBar(SnackBar(content: Text('Invalid OTP')));
//     }
//   }
// }