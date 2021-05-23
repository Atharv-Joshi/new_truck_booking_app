
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
class TruckTypeWidgetScreen extends StatefulWidget {
  void clearAll(){
    color_1 = colorUnselected;
    color_2 = colorUnselected;
    color_3 = colorUnselected;
    color_4 = colorUnselected;
    color_5 = colorUnselected;
    color_6 = colorUnselected;
  }
  @override
  _TruckTypeWidgetScreenState createState() => _TruckTypeWidgetScreenState();
}
class _TruckTypeWidgetScreenState extends State<TruckTypeWidgetScreen> {
  @override

  void invertAllColor(int cardNumber) {
    if (cardNumber == 1 && color_1 == colorUnselected) {
      color_1 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'Container');
    } else if (cardNumber == 2 && color_2 == colorUnselected) {
      color_2 = colorSelected;
      color_1 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'Hyva');
    } else if (cardNumber == 3 && color_3 == colorUnselected) {
      color_3 = colorSelected;
      color_2 = colorUnselected;
      color_1 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'LCV');
    }
    else if (cardNumber == 4 && color_4 == colorUnselected) {
      color_4 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_1 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'Tanker');
    }
    else if (cardNumber == 5 && color_5 == colorUnselected) {
      color_5 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_1 = colorUnselected;
      color_6 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'Trailer');
    }
    else if (cardNumber == 6 && color_6 == colorUnselected) {
      color_6 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_1 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateTruckPreference(newValue: 'Truck');
    }}
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
                        buildTruckCard(context: context,cardName: 'Container',cardImage: 'container',cardNumber: 1 ,cardColor: color_1),
                        buildTruckCard(context: context,cardName: 'Hyva',cardImage: 'hyva',cardNumber: 2 ,cardColor: color_2),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'LCV',cardImage: 'lcv',cardNumber: 3 ,cardColor: color_3),
                        buildTruckCard(context: context,cardName: 'Tanker',cardImage: 'tanker',cardNumber: 4 ,cardColor: color_4),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'Trailer',cardImage: 'trailer',cardNumber: 5 ,cardColor: color_5),
                        buildTruckCard(context: context,cardName: 'Truck',cardImage: 'truck',cardNumber: 6 ,cardColor: color_6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      );
    }

    GestureDetector buildTruckCard({BuildContext context, String cardName, String cardImage, int cardNumber, Color cardColor}) {
      return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        invertAllColor(cardNumber);
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