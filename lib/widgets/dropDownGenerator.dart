import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownGenerator extends StatefulWidget {
  final String dropdownValue;
  final List<String> dropdownValues;
  final String notAllowedValue;
  final String dropDownNumber;
  String hintText = ' ';
  DropDownGenerator(
      {this.dropdownValue,
        this.dropdownValues,
        this.dropDownNumber,
        this.notAllowedValue,
        this.hintText});

  @override
  _DropDownGeneratorState createState() => _DropDownGeneratorState();
}

class _DropDownGeneratorState extends State<DropDownGenerator> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.dropdownValue,
      hint: Text(
        '${widget.hintText}',
        style: TextStyle(color: Colors.grey),
      ),
      iconDisabledColor: Colors.black54,
      elevation: 16,
      style: TextStyle(color: Colors.grey, fontSize: 18),
      items:
      widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




