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

class NoOfTrucksWidgetScreen extends StatefulWidget {
  @override
  _NoOfTrucksWidgetScreenState createState() => _NoOfTrucksWidgetScreenState();
}

class _NoOfTrucksWidgetScreenState extends State<NoOfTrucksWidgetScreen> {
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
          .updateNoOfTrucks(newValue: '1');
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
          .updateNoOfTrucks(newValue: '2');
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
          .updateNoOfTrucks(newValue: '3');
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
          .updateNoOfTrucks(newValue: '4');
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
          .updateNoOfTrucks(newValue: '5');
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
          .updateNoOfTrucks(newValue: '6');
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
          .updateNoOfTrucks(newValue: '7');
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
          .updateNoOfTrucks(newValue: '8');
    }
    else if (cardNumber == 9 && color_9 == colorUnselected) {
      color_9 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_1 = colorUnselected;
      color_10 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateNoOfTrucks(newValue: '9');
    }
    else if (cardNumber == 10 && color_10 == colorUnselected) {
      color_10 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_1 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateNoOfTrucks(newValue: '10');
    }

  }
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3 ),
      insetPadding:  EdgeInsets.only(left: 0, right: 0, ),
      content:  SingleChildScrollView(
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
                  buildNoOfTrucksCard(context: context,cardName: '1',cardNumber: 1 ,cardColor: color_1),
                  buildNoOfTrucksCard(context: context,cardName: '2',cardNumber: 2 ,cardColor: color_2),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(context: context,cardName: '3',cardNumber: 3 ,cardColor: color_3),
                  buildNoOfTrucksCard(context: context,cardName: '4',cardNumber: 4 ,cardColor: color_4),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(context: context,cardName: '5',cardNumber: 5 ,cardColor: color_5),
                  buildNoOfTrucksCard(context: context,cardName: '6',cardNumber: 6 ,cardColor: color_6),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(context: context,cardName: '7',cardNumber: 7 ,cardColor: color_7),
                  buildNoOfTrucksCard(context: context,cardName: '8',cardNumber: 8 ,cardColor: color_8),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNoOfTrucksCard(context: context,cardName: '9',cardNumber: 9 ,cardColor: color_9),
                  buildNoOfTrucksCard(context: context,cardName: '10',cardNumber: 10 ,cardColor: color_10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildNoOfTrucksCard({BuildContext context, String cardName, int cardNumber, Color cardColor}) {
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
