import 'package:flutter/material.dart';

class TruckDetailsCard extends StatelessWidget {
  final String imei;
  final String mobileNum;

  TruckDetailsCard(
      {this.imei,this.mobileNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color(0xFFF3F2F1),
        elevation: 10,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          padding: EdgeInsets.only(top: 1, bottom: 8, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(imei, style: TextStyle(fontSize: 18,),),
              SizedBox(
                height: 3,
              ),
              Text(mobileNum, style: TextStyle(fontSize: 18,),),
            ],
          ),
        ),
      ),
    );
  }
}