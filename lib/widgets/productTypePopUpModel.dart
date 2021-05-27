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
  unselectedColor,
  unselectedColor,
  unselectedColor
];

int n = 12;

class ProductTypeWidgetScreen extends StatefulWidget {
  void clearAll() {
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
  }

  @override
  _ProductTypeWidgetScreenState createState() =>
      _ProductTypeWidgetScreenState();
}

class _ProductTypeWidgetScreenState extends State<ProductTypeWidgetScreen> {
  void invertAllColour(int cardNumber, String cardValue) {
    for (int i = 0; i < n; i++) {
      color[i] = unselectedColor;
    }
    color[cardNumber - 1] = selectedColor;
    Provider.of<ProviderData>(context, listen: false)
        .updateProductType(newValue: cardValue);

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
                child: Text('Select Product Type'),
              ),
              color: Color(0xFFF3F2F1),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Packaged/Consumer boxes',
                      cardNumber: 1,
                      cardColor: color[0],
                      cardValue: "Packaged/ Consumer boxes"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Food and\nagriculture',
                      cardNumber: 2,
                      cardColor: color[1],
                      cardValue: "Food and agriculture"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Machine/\nAuto Parts',
                      cardNumber: 3,
                      cardColor: color[2],
                      cardValue: "Machine/ Auto Parts"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Electronic goods',
                      cardNumber: 4,
                      cardColor: color[3],
                      cardValue: "Electronic goods"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Chemical /\nPowder',
                      cardNumber: 5,
                      cardColor: color[4],
                      cardValue: "Chemical/ Powder"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Scrap',
                      cardNumber: 6,
                      cardColor: color[5],
                      cardValue: "Scrap"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Construction material',
                      cardNumber: 7,
                      cardColor: color[6],
                      cardValue: "Construction material"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Petroleum / Paint',
                      cardNumber: 8,
                      cardColor: color[7],
                      cardValue: "Petroleum / Paint"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Tyre',
                      cardNumber: 9,
                      cardColor: color[8],
                      cardValue: "Tyre"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Battery',
                      cardNumber: 10,
                      cardColor: color[9],
                      cardValue: "Battery"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Cylinders',
                      cardNumber: 11,
                      cardColor: color[10],
                      cardValue: "Cylinders"),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Alcoholic\nBeverages',
                      cardNumber: 12,
                      cardColor: color[11],
                      cardValue: "Alcoholic Beverages"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildProductTypeCard(
      {BuildContext context,
      String cardName,
      int cardNumber,
      Color cardColor,
      String cardValue}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          invertAllColour(cardNumber, cardValue);
        });
      },
      child: Container(
        color: cardColor,
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/productTypeImages/material$cardNumber.jpeg'),
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
