import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/models/providerData.dart';

Color unselectedColor = Colors.white;
Color selectedColor = Colors.black45;
List<Color> color = [
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor,
  unselectedColor
];
int n =10;
class NoOfTrucksWidgetScreen extends StatefulWidget {
  @override
  _NoOfTrucksWidgetScreenState createState() => _NoOfTrucksWidgetScreenState();
}

class _NoOfTrucksWidgetScreenState extends State<NoOfTrucksWidgetScreen> {
  void invertAllColour(int cardNumber) {
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
    color[cardNumber - 1] = selectedColor;
    Provider.of<ProviderData>(context, listen: false)
        .updateNoOfTrucks(newValue: cardNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
      insetPadding: EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Container(
              height: 50,
              child: Center(
                child: Text('Select No Of Trucks'),
              ),
              color: Color(0xFFF3F2F1),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '1',
                      cardNumber: 1,
                      cardColor: color[0]),
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '2',
                      cardNumber: 2,
                      cardColor: color[1]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '3',
                      cardNumber: 3,
                      cardColor: color[2]),
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '4',
                      cardNumber: 4,
                      cardColor: color[3]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '5',
                      cardNumber: 5,
                      cardColor: color[4]),
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '6',
                      cardNumber: 6,
                      cardColor: color[5]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '7',
                      cardNumber: 7,
                      cardColor: color[6]),
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '8',
                      cardNumber: 8,
                      cardColor: color[7]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '9',
                      cardNumber: 9,
                      cardColor: color[8]),
                  buildNoOfTrucksCard(
                      context: context,
                      cardName: '10',
                      cardNumber: 10,
                      cardColor: color[9]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildNoOfTrucksCard(
      {BuildContext context,
      String cardName,
      int cardNumber,
      Color cardColor}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          invertAllColour(cardNumber);
        });
      },
      child: Container(
        color: cardColor,
        height: 70,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$cardName',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
