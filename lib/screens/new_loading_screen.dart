import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';



class NewLoadingScreen extends StatefulWidget {
  static final String routeName = '/loading';
  @override
  _NewLoadingScreenState createState() => _NewLoadingScreenState();
}

class _NewLoadingScreenState extends State<NewLoadingScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Color.fromRGBO(0, 0, 0, 0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SpinKitRing(
          size: 60,
          lineWidth: 4,
          color: Colors.black,
          ) ,
      ),
    );
  }
}
