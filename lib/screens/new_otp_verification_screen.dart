import 'dart:ui';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Liveasy/widgets/curves.dart';
import 'package:Liveasy/widgets/card_template.dart';
import 'package:Liveasy/getxcontrollers/getx_controllers.dart';
import 'package:Liveasy/Services/auth_functions.dart';

class NewOTPVerificationScreen extends StatefulWidget {
  static final routeName = '/otpverification';
  final String phoneNumber;

  NewOTPVerificationScreen(this.phoneNumber);
  @override
  _NewOTPVerificationScreenState createState() =>
      _NewOTPVerificationScreenState();
}

class _NewOTPVerificationScreenState extends State<NewOTPVerificationScreen> {
  AuthFunctions authFunctions = AuthFunctions();

  HudController hudController = HudController();
  bool showProgressHud = false;
  bool resendtimeout = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = '';
  int _forceResendingToken;
  String _smsCode = '';
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          offset: Offset.fromDirection(1), color: Colors.grey, blurRadius: 2),
    ],
    borderRadius: BorderRadius.circular(10),
    color: const Color(0xffFFFFFF),
    border: Border.all(
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
  );

  TimerController timerController = Get.put(TimerController());
  Color resendButtonColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
        ),
        inAsyncCall: showProgressHud,
        // inAsyncCall: hudController.hudController.value,
        child: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: [
                OrangeCurve(),
                GreenCurve(),
                CardTemplate(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 50, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child:
                                Text('OTP send to +91${widget.phoneNumber}')),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: PinPut(
                            fieldsCount: 6,
                            textStyle: const TextStyle(
                                fontSize: 25.0, color: Colors.black),
                            eachFieldWidth: 40.0,
                            eachFieldHeight: 55.0,
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration: pinPutDecoration,
                            selectedFieldDecoration: pinPutDecoration,
                            followingFieldDecoration: pinPutDecoration,
                            pinAnimationType: PinAnimationType.fade,
                            onSubmit: (pin) async {
                              _smsCode = pin;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: TextButton(
                                  onPressed:
                                      timerController.timeOnTimer.value > 0
                                          ? null
                                          : () {
                                              setState(() {
                                                resendButtonColor = Colors.grey;
                                                timerController.startTimer();
                                                // hudController
                                                //     .updateHudController(true);
                                                showProgressHud = true;
                                              });
                                            },
                                  child: Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                      letterSpacing: 0.5,
                                      color: resendButtonColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Obx(
                                    () => Text(
                                      'Remaining time :  ${timerController.timeOnTimer}',
                                      style: TextStyle(
                                          color: const Color(0xff109E92)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              height: 45,
                              margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff33364D)),
                                  ),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                  onPressed: () {
                                    // hudController.updateHudController(true);
                                    setState(() {
                                      showProgressHud = true;
                                    });
                                    print(
                                        'hud true due to pressing of confirm button');
                                    timerController.cancelTimer();
                                    // authFunctions.manualVerification(_smsCode);
                                    manualVerification();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Want to change number',
                                  style: TextStyle(
                                    color: const Color(0xff109E92),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    timerController.startTimer();
    print('hud true due to initstate');
    // hudController.updateHudController(true);
    setState(() {
      showProgressHud = true;
    });

    _verifyPhoneNumber();
    // authFunctions.verifyPhoneNumber(widget.phoneNumber);
  }

  _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: _forceResendingToken,
        phoneNumber: '+91${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential result =
              await FirebaseAuth.instance.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {
            print(user.uid);
          }
          // _timer.cancel();
          timerController.cancelTimer();
          setState(() {
            print('hud false due to verificationCompleted');

            showProgressHud = false;
          });

          Get.offAll(() => Demo());
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            print('hud false due to verificationFailed');
            // hudController.updateHudController(false);
            showProgressHud = false;
          });
          print(e.message);
        },
        codeSent: (String verficationId, int resendToken) {
          setState(() {
            _forceResendingToken = resendToken;
            _verificationCode = verficationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted) {
            setState(() {
              // closes the loading screen after 60 seconds in autoverfii doesnt work .. works fine.
              print('hud false due to codeAutoRetrievalTimeout');
              // hudController.updateHudController(false);
              showProgressHud = false;
              _verificationCode = verificationId;
            });
          }
        },
        timeout: Duration(seconds: 60));
  }

  void manualVerification() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: _smsCode))
          .then((value) async {
        if (value.user != null) {
          setState(() {
            print('hud false due to try in manual verification');
            // hudController.updateHudController(false);
            showProgressHud = false;
          });
          Get.offAll(() => Demo());
        }
      });
    } catch (e) {
      FocusScope.of(context).unfocus();
      setState(() {
        print('hud false due to catch in manual verification');
        // hudController.updateHudController(false);
        showProgressHud = false;
      });
      Get.snackbar('Invalid Otp', 'Please Enter the correct OTP',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }
} // class end
