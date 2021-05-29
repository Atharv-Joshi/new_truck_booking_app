import 'dart:ui';
import 'package:Liveasy/getxcontrollers/hud_controller.dart';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';
import 'package:Liveasy/providers/providerdata.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Liveasy/widgets/curves.dart';
import 'package:Liveasy/widgets/card_template.dart';
import 'package:Liveasy/Services/auth_functions.dart';
import 'package:provider/provider.dart';


class NewOTPVerificationScreen extends StatefulWidget {
  static final routeName = '/otpverification';
  final String phoneNumber;

  NewOTPVerificationScreen(this.phoneNumber);
  @override
  _NewOTPVerificationScreenState createState() =>
      _NewOTPVerificationScreenState();
}

class _NewOTPVerificationScreenState extends State<NewOTPVerificationScreen> {
//--------------------------------------------------------------------------------------------------------------------
  AuthService authService = AuthService();


  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = '';
  int _forceResendingToken;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  //this will be put as a const decoration
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



  HudController hudController = Get.put(HudController());

  //--------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    ProviderData providerData = Provider.of<ProviderData>(context);
    return Scaffold(
        key: _scaffoldkey,
        body: Obx(() => ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              inAsyncCall: hudController.showHud.value,
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
                                  child: Text(
                                      'OTP send to +91${widget.phoneNumber}')),
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
                                  onChanged: (pin) async {
                                    if (pin.length == 6) {
                                      providerData.updateInputControllerLengthCheck(true);
                                      providerData.updateButtonColor(MaterialStateProperty.all<Color>(Color(0xff33364D)));
                                      providerData.updateSmsCode(pin);
                                    } else {
                                      providerData.updateInputControllerLengthCheck(false);
                                      providerData.updateButtonColor(MaterialStateProperty.all<Color>(Colors.grey));
                                    }
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: TextButton(
                                        onPressed: timerController
                                                    .timeOnTimer.value >
                                                0
                                            ? null
                                            : () {
                                                timerController.startTimer();
                                                hudController.updateHud(true);
                                              },
                                        child: Text(
                                          'Resend OTP',
                                          style: TextStyle(
                                            letterSpacing: 0.5,
                                            color: resendButtonColor,
                                            decoration:
                                                TextDecoration.underline,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    height: 45,
                                    margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: providerData.buttonColor,
                                          ),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(
                                              color: const Color(0xffFFFFFF),
                                            ),
                                          ),
                                          onPressed: providerData.inputControllerLengthCheck
                                              ? () {
                                                  hudController.updateHud(true);
                                                  timerController.cancelTimer();
                                                  authService.manualVerification(
                                                      smsCode: providerData.smsCode,
                                                      verificationId:
                                                          _verificationCode);
                                                  providerData.clearall();
                                                }
                                              : null
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
            )) // obx,
        );
  }

  @override
  void initState() {

    super.initState();
    timerController.startTimer();
    hudController.updateHud(true);
    _verifyPhoneNumber();

  }

  void _verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          //this value changes runtime
          forceResendingToken: _forceResendingToken,
          phoneNumber: '+91${widget.phoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            UserCredential result =
                await FirebaseAuth.instance.signInWithCredential(credential);
            User user = result.user;
            if (user != null) {
              print(user.uid);
            }
            timerController.cancelTimer();
            hudController.updateHud(false);

            Get.offAll(() => Demo());
          },
          verificationFailed: (FirebaseAuthException e) {
            hudController.updateHud(false);
            print(e.message);
          },
          codeSent: (String verificationId, int resendToken) {
            setState(() {
              _forceResendingToken = resendToken;
              _verificationCode = verificationId;
            });
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            if (mounted) {
              hudController.updateHud(false);
              timerController.cancelTimer();
              setState(() {
                _verificationCode = verificationId;
              });
            }
          },
          timeout: Duration(seconds: 60));
    } catch (e) {
      hudController.updateHud(false);
    }
  }
} // class end
