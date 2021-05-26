import 'package:flutter/material.dart';
import 'package:Liveasy/widgets/curve_generator.dart';

class OrangeCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OrangeClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffFF9933),
      ),
    );
  }
}

class GreenCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
                clipper: GreenClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff39B82D),
                ),
              );
  }
}