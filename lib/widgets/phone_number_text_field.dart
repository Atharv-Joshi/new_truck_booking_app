import 'package:flutter/material.dart';
import 'package:Liveasy/providers/providerdata.dart';
import 'package:provider/provider.dart';

class PhoneNumberTextField extends StatefulWidget {

  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    ProviderData providerData = Provider.of<ProviderData>(context);
    

    return TextFormField(
      onChanged: (_controller) {
        if (_controller.length == 10) {
          providerData.updateInputControllerLengthCheck(true);
          providerData.updateButtonColor(
              MaterialStateProperty.all<Color>(Color(0xff33364D)));
          
        } else {
          providerData.updateInputControllerLengthCheck(false);
          providerData
              .updateButtonColor(MaterialStateProperty.all<Color>(Colors.grey));
        }
        providerData.updatePhoneController(_controller);
      },
      maxLength: 10,
      controller: _controller,
      validator: (value) =>
          value.length == 10 ? null : 'Enter a Correct Phone Number',
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              '+91 ',
              style: TextStyle(
                color: const Color(0xff7A7C8B),
                fontSize: 14,
              ),
            )),
        filled: true,
        fillColor: const Color(0xffECEEF1),
        hintText: 'Enter Phone Number',
        hintStyle: TextStyle(color: const Color(0xff7A7C8B)),
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
    );
  }
}
