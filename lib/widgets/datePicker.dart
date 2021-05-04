import 'package:flutter/material.dart';

class DatePickerGenerator extends StatelessWidget {
  final String date;
  DatePickerGenerator({this.date});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        '$date',
        style: TextStyle(color: Colors.grey),
      ),
      icon: Icon(Icons.date_range_outlined),
      iconDisabledColor: Colors.black54,
      elevation: 16,
      style: TextStyle(color: Colors.grey, fontSize: 18),
      items: [],
    );
  }
}
