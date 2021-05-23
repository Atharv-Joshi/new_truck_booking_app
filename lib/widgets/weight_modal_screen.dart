import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/widgets/providerData.dart';

Color colorUnselected = Colors.white;
Color colorSelected = Colors.black45;
Color color_1 = colorUnselected;
Color color_2 = colorUnselected;
Color color_3 = colorUnselected;
Color color_4 = colorUnselected;
Color color_5 = colorUnselected;
Color color_6 = colorUnselected;
Color color_7 = colorUnselected;
Color color_8 = colorUnselected;
Color color_9 = colorUnselected;
Color color_10 = colorUnselected;

class WeightWidgetScreen extends StatefulWidget {
  void clearAll(){
    color_1 = colorUnselected;
    color_2 = colorUnselected;
    color_3 = colorUnselected;
    color_4 = colorUnselected;
    color_5 = colorUnselected;
    color_6 = colorUnselected;
    color_7 = colorUnselected;
    color_8 = colorUnselected;
    color_9 = colorUnselected;
    color_10 = colorUnselected;
  }
  @override
  _WeightWidgetScreenState createState() => _WeightWidgetScreenState();
}

class _WeightWidgetScreenState extends State<WeightWidgetScreen> {

  void invertAllColor(int cardNumber) {
    if (cardNumber == 1 && color_1 == colorUnselected) {
      color_1 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '5');
    } else if (cardNumber == 2 && color_2 == colorUnselected) {
      color_2 = colorSelected;
      color_1 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '10');
    } else if (cardNumber == 3 && color_3 == colorUnselected) {
      color_3 = colorSelected;
      color_2 = colorUnselected;
      color_1 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '15');
    }
    else if (cardNumber == 4 && color_4 == colorUnselected) {
      color_4 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_1 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '20');
    }
    else if (cardNumber == 5 && color_5 == colorUnselected) {
      color_5 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_1 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '25');
    }
    else if (cardNumber == 6 && color_6 == colorUnselected) {
      color_6 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_1 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '30');
    }else if (cardNumber == 7 && color_7 == colorUnselected) {
      color_7 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_1 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: '35');
    }
    else if (cardNumber == 8 && color_8 == colorUnselected) {
      color_8 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_1 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateWeight(newValue: 'More than 35 tons');
    }
    // else if (cardNumber == 9 && color_9 == color_Unselected) {
    //   color_9 = color_Selected;
    //   color_2 = color_Unselected;
    //   color_3 = color_Unselected;
    //   color_4 = color_Unselected;
    //   color_5 = color_Unselected;
    //   color_6 = color_Unselected;
    //   color_7 = color_Unselected;
    //   color_8 = color_Unselected;
    //   color_1 = color_Unselected;
    //   color_10 = color_Unselected;
    //   Provider.of<NewDataByShipper>(context, listen: false)
    //       .updateWeight(newValue: '9');
    // }
    // else if (cardNumber == 10 && color_10 == color_Unselected) {
    //   color_10 = color_Selected;
    //   color_2 = color_Unselected;
    //   color_3 = color_Unselected;
    //   color_4 = color_Unselected;
    //   color_5 = color_Unselected;
    //   color_6 = color_Unselected;
    //   color_7 = color_Unselected;
    //   color_8 = color_Unselected;
    //   color_9 = color_Unselected;
    //   color_1 = color_Unselected;
    //   Provider.of<NewDataByShipper>(context, listen: false)
    //       .updateWeight(newValue: '10');
    // }

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
                      buildWeightCard(context: context,cardName: '1',cardNumber: 1 ,cardColor: color_1),
                      buildWeightCard(context: context,cardName: '2',cardNumber: 2 ,cardColor: color_2),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '3',cardNumber: 3 ,cardColor: color_3),
                      buildWeightCard(context: context,cardName: '4',cardNumber: 4 ,cardColor: color_4),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '5',cardNumber: 5 ,cardColor: color_5),
                      buildWeightCard(context: context,cardName: '6',cardNumber: 6 ,cardColor: color_6),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeightCard(context: context,cardName: '7',cardNumber: 7 ,cardColor: color_7),
                      buildWeightCard(context: context,cardName: '8',cardNumber: 8 ,cardColor: color_8),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }

  GestureDetector buildWeightCard({BuildContext context, String cardName, int cardNumber, Color cardColor}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          invertAllColor(cardNumber);
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
            // Container(
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //           'assets/$CardImage.jpeg'),
            //     ),
            //   ),
            // ),
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
