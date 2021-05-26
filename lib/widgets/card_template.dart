import 'package:flutter/material.dart';

class CardTemplate extends StatefulWidget {
  Widget child;

  CardTemplate({ @required this.child});
  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.06,
          MediaQuery.of(context).size.height * 0.2,
          MediaQuery.of(context).size.width * 0.06,
          MediaQuery.of(context).size.height * 0.3,
        ),
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.50,
        child: Card(
          shadowColor: Colors.grey[400],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: widget.child,
        ));
  }
}
