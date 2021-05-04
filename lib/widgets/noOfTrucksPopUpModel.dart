import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/models/providerData.dart';
Color color_Unselected = Colors.white;
Color color_Selected = Colors.black45;
Color color_1 = color_Unselected;
Color color_2 = color_Unselected;
Color color_3 = color_Unselected;
Color color_4 = color_Unselected;
Color color_5 = color_Unselected;
Color color_6 = color_Unselected;
Color color_7 = color_Unselected;
Color color_8 = color_Unselected;
Color color_9 = color_Unselected;
Color color_10 = color_Unselected;

class NoOfTrucksWidgetScreen extends StatefulWidget {
  @override
  _NoOfTrucksWidgetScreenState createState() => _NoOfTrucksWidgetScreenState();
}

class _NoOfTrucksWidgetScreenState extends State<NoOfTrucksWidgetScreen> {
  void invertAllColour(int cardNumber) {
    if (cardNumber == 1 && color_1 == color_Unselected) {
      color_1 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '1');
    } else if (cardNumber == 2 && color_2 == color_Unselected) {
      color_2 = color_Selected;
      color_1 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '2');
    } else if (cardNumber == 3 && color_3 == color_Unselected) {
      color_3 = color_Selected;
      color_2 = color_Unselected;
      color_1 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '3');
    }
    else if (cardNumber == 4 && color_4 == color_Unselected) {
      color_4 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_1 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '4');
    }
    else if (cardNumber == 5 && color_5 == color_Unselected) {
      color_5 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_1 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '5');
    }
    else if (cardNumber == 6 && color_6 == color_Unselected) {
      color_6 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_1 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '6');
    }else if (cardNumber == 7 && color_7 == color_Unselected) {
      color_7 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_1 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '7');
    }
    else if (cardNumber == 8 && color_8 == color_Unselected) {
      color_8 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_1 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '8');
    }
    else if (cardNumber == 9 && color_9 == color_Unselected) {
      color_9 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_1 = color_Unselected;
      color_10 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateNoOfTrucks(newValue: '9');
    }
    else if (cardNumber == 10 && color_10 == color_Unselected) {
      color_10 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_1 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
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
