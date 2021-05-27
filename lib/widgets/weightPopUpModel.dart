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

class WeightWidgetScreen extends StatefulWidget {
  void clearAll(){
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
  }
  @override
  _WeightWidgetScreenState createState() => _WeightWidgetScreenState();
}

class _WeightWidgetScreenState extends State<WeightWidgetScreen> {

  void invertAllColour(int cardNumber, String cardValue) {
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
    color[cardNumber - 1] = selectedColor;
    Provider.of<ProviderData>(context, listen: false)
        .updateWeight(newValue: cardValue);

  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3 ),
      insetPadding:  EdgeInsets.only(left: 0, right: 0, ),
      content:  SingleChildScrollView(
        child: ListBody(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Center(
                    child: Text('Select Weight'),
                  ),
                  color: Color(0xFFF3F2F1),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '5',cardNumber: 1 ,cardColor: color[0], cardValue: "Upto 5 ton"),
                      buildWeightCard(context: context,cardName: '10',cardNumber: 2 ,cardColor: color[1], cardValue: "Upto 10 ton"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '15',cardNumber: 3 ,cardColor: color[2], cardValue: "Upto 15 ton"),
                      buildWeightCard(context: context,cardName: '20',cardNumber: 4 ,cardColor: color[3], cardValue: "Upto 20 ton"),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '25',cardNumber: 5 ,cardColor: color[4],cardValue: "Upto 25 ton"),
                      buildWeightCard(context: context,cardName: '30',cardNumber: 6 ,cardColor: color[5], cardValue: "Upto 30 ton"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '35',cardNumber: 7 ,cardColor: color[6], cardValue: "Upto 35 ton"),
                      buildWeightCard(context: context,cardName: '40',cardNumber: 8 ,cardColor: color[7], cardValue: "Upto 40 ton"),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }

  GestureDetector buildWeightCard({BuildContext context, String cardName, int cardNumber, Color cardColor, String cardValue}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          invertAllColour(cardNumber, cardValue);
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
              'Upto $cardName ton',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
