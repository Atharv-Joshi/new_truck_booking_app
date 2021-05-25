import 'dart:async';
import 'dart:ui';
import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/screens/new_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:Liveasy/widgets/curves.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewOTPVerificationScreen extends StatefulWidget {
  static final routeName = '/otpverification';
  final String phoneNumber;

  NewOTPVerificationScreen(this.phoneNumber);
  @override
  _NewOTPVerificationScreenState createState() =>
      _NewOTPVerificationScreenState();
}

class _NewOTPVerificationScreenState extends State<NewOTPVerificationScreen> {
  bool _isLoading = false;
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

  int timeOnTimer;
  Timer _timer;

  Color resendButtonColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              ClipPath(
                  clipper: OrangeClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xffFF9933),
                  ),
                ),
              ClipPath(
                clipper: GreenClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff39B82D),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.06,
                  MediaQuery.of(context).size.height * 0.2,
                  MediaQuery.of(context).size.width * 0.06,
                  MediaQuery.of(context).size.height * 0.3,
                ),
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height *
                    0.55, //originally it was 0.5
                child: Card(
                  shadowColor: Colors.grey[400],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
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
                              // margin: EdgeInsets.only(right: 1,),
                              child: TextButton(
                                  onPressed: timeOnTimer > 0
                                      ? null
                                      : () {
                                          setState(() {
                                            resendButtonColor = Colors.grey;
                                            timeOnTimer = 60;
                                            startTimer();
                                            resendtimeout = true;
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
                                  Text(
                                    'Remaining time :  $timeOnTimer',
                                    style: TextStyle(
                                        color: const Color(0xff109E92)),
                                  ),
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
                                    _timer.cancel();
                                    manualVerification();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  // manualVerification();
                                  Navigator.pushReplacementNamed(context, '/');
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
              ),
              // NewLoadingScreen()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    startTimer();
    _verifyPhoneNumber();
  }

  void startTimer() {
    timeOnTimer = 60;

    //remove setstate if needed
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeOnTimer > 0) {
          timeOnTimer--;
        } else {
          _timer.cancel();
          resendButtonColor = const Color(0xff109E92);
        }
      });
    });
  }

  _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: _forceResendingToken,
        phoneNumber: '+91${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential result =
              await FirebaseAuth.instance.signInWithCredential(credential);
          User user = result.user;
          print(user);
          print('Auto login successfull');
          if (user != null) {
            print(user.uid);
          }
          _timer.cancel();
          // Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/demo');
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationId, int resendToken) {
          setState(() {
            _forceResendingToken = resendToken;
            _verificationCode = verficationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  // int abc() {
  //   if (resendtimeout) {
  //     return _forceResendingToken;
  //   }
  // }

  void manualVerification() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: _smsCode))
          .then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Demo()),
              (route) => false);
        }
      });
    } catch (e) {
      FocusScope.of(context).unfocus();
      _scaffoldkey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text('Invalid OTP')));
    }
  }
} // class end
