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
Color color_11 = color_Unselected;
Color color_12 = color_Unselected;

class ProductTypeWidgetScreen extends StatefulWidget {
  void clearAll(){
    color_1 = color_Unselected;
    color_2 = color_Unselected;
    color_3 = color_Unselected;
    color_4 = color_Unselected;
    color_5 = color_Unselected;
    color_6 = color_Unselected;
    color_7 = color_Unselected;
    color_8 = color_Unselected;
    color_9 = color_Unselected;
    color_10 = color_Unselected;
    color_11 = color_Unselected;
    color_12 = color_Unselected;
  }
  @override
  _ProductTypeWidgetScreenState createState() =>
      _ProductTypeWidgetScreenState();
}

class _ProductTypeWidgetScreenState extends State<ProductTypeWidgetScreen> {

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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Packaged/ Consumer boxes');
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Food and agriculture');
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Machine/Auto Parts');
    } else if (cardNumber == 4 && color_4 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Electronic goods');
    } else if (cardNumber == 5 && color_5 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Chemical / Powder');
    } else if (cardNumber == 6 && color_6 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Scrap');
    } else if (cardNumber == 7 && color_7 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Construction material');
    } else if (cardNumber == 8 && color_8 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Petroleum / Paint');
    } else if (cardNumber == 9 && color_9 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Tyre');
    } else if (cardNumber == 10 && color_10 == color_Unselected) {
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
      color_11 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Battery');
    } else if (cardNumber == 11 && color_11 == color_Unselected) {
      color_11 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      color_1 = color_Unselected;
      color_12 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Cylinders');
    } else if (cardNumber == 12 && color_12 == color_Unselected) {
      color_12 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      color_7 = color_Unselected;
      color_8 = color_Unselected;
      color_9 = color_Unselected;
      color_10 = color_Unselected;
      color_11 = color_Unselected;
      color_1 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateProductType(newValue: 'Alcoholic Beveragers');
    }
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
                      cardColor: color_1),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Food and\nagriculture',
                      cardNumber: 2,
                      cardColor: color_2),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Machine/\nAuto Parts',
                      cardNumber: 3,
                      cardColor: color_3),
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
                      cardColor: color_4),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Chemical /\nPowder',
                      cardNumber: 5,
                      cardColor: color_5),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Scrap',
                      cardNumber: 6,
                      cardColor: color_6),
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
                      cardColor: color_7),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Petroleum / Paint',
                      cardNumber: 8,
                      cardColor: color_8),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Tyre',
                      cardNumber: 9,
                      cardColor: color_9),
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
                      cardColor: color_10),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Cylinders',
                      cardNumber: 11,
                      cardColor: color_11),
                  buildProductTypeCard(
                      context: context,
                      cardName: 'Alcoholic\nBeverages',
                      cardNumber: 12,
                      cardColor: color_12),
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
