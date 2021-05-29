import 'package:Liveasy/screens/new_otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:Liveasy/widgets/curves.dart';
import 'package:get/get.dart';
import 'package:Liveasy/widgets/card_template.dart';
import 'package:Liveasy/providers/providerdata.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/widgets/phone_number_text_field.dart';

class NewLoginScreen extends StatefulWidget {
  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProviderData providerData = Provider.of<ProviderData>(context);
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
                          child: PhoneNumberTextField(),
                      ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(40, 55, 40, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: providerData.buttonColor,
                              ),
                              child: Text(
                                'Send OTP',
                                style: TextStyle(
                                  color: const Color(0xffFFFFFF),
                                ),
                              ),
                              onPressed: providerData.inputControllerLengthCheck
                                  ? () {
                                      if (_formKey.currentState.validate()) {
                                        Get.to(() => NewOTPVerificationScreen(
                                            providerData.phoneController));    
                                        providerData.clearall();
                                      } // if
                                    }
                                  : () {}),
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
