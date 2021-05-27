
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
  unselectedColor
];

int n = 6;

class TruckTypeWidgetScreen extends StatefulWidget {
  void clearAll(){
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
  }
  @override
  _TruckTypeWidgetScreenState createState() => _TruckTypeWidgetScreenState();
}
class _TruckTypeWidgetScreenState extends State<TruckTypeWidgetScreen> {
  void invertAllColour(int cardNumber, String cardValue) {
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
    color[cardNumber - 1] = selectedColor;
    Provider.of<ProviderData>(context, listen: false)
        .updateTruckPreference(newValue: cardValue);
    }
    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3 ),
        insetPadding:  EdgeInsets.only(left: 0, right: 0, ),
        content:  SingleChildScrollView(
          child: ListBody(
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text('Select Truck Type'),
                    ),
                    color: Color(0xFFF3F2F1),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'Container',cardImage: 'container',cardNumber: 1 ,cardColor: color[0],cardValue: "Container"),
                        buildTruckCard(context: context,cardName: 'Hyva',cardImage: 'hyva',cardNumber: 2 ,cardColor: color[1],cardValue: "Hyva"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'LCV',cardImage: 'lcv',cardNumber: 3 ,cardColor: color[2], cardValue: "LCV"),
                        buildTruckCard(context: context,cardName: 'Tanker',cardImage: 'tanker',cardNumber: 4 ,cardColor: color[3],cardValue: "Tanker"),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'Trailer',cardImage: 'trailer',cardNumber: 5 ,cardColor: color[4],cardValue: "Trailer"),
                        buildTruckCard(context: context,cardName: 'Truck',cardImage: 'truck',cardNumber: 6 ,cardColor: color[5], cardValue: "Truck"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      );
    }

    GestureDetector buildTruckCard({BuildContext context, String cardName, String cardImage, int cardNumber, Color cardColor, String cardValue}) {
      return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        invertAllColour(cardNumber, cardValue);
                      });
                    },
                    child: Container(
                      color: cardColor,
                      height: 120,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/$cardImage.jpeg'),
                              ),
                            ),
                          ),
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