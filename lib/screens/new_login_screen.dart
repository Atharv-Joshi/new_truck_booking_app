import 'package:Liveasy/screens/new_otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:Liveasy/widgets/curves.dart';
import 'package:get/get.dart';
import 'package:Liveasy/widgets/card_template.dart';

class NewLoginScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              OrangeCurve(),
              GreenCurve(),
              CardTemplate(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 80, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            color: const Color(0xff33364D),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 16, 0, 30),
                            child: Text(
                              'Enter your Phone Number',
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff000000),
                              ),
                            )),
                        Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _controller,
                              validator: (value) => value.length == 10
                                  ? null
                                  : 'Enter a Correct Phone Number',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefix: Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    '+91',
                                    style: TextStyle(
                                        color: const Color(0xff7A7C8B)),
                                  ),
                                ),
                                filled: true,
                                fillColor: const Color(0xffECEEF1),
                                hintText: 'Enter Phone Number',
                                hintStyle:
                                    TextStyle(color: const Color(0xff7A7C8B)),
                                suffixIcon: Icon(
                                  Icons.call_outlined,
                                  color: const Color(0xff9FA3A8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      width: 1,
                                      color: const Color(0xffECEEF1)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      width: 1,
                                      color: const Color(0xffECEEF1)),
                                ),
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 45,
                          margin: EdgeInsets.fromLTRB(40, 55, 40, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff33364D)),
                                ),
                                child: Text(
                                  'Send OTP',
                                  style: TextStyle(
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Get.to(NewOTPVerificationScreen(
                                        _controller.text));
                                  } // if
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
