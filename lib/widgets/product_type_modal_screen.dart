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
Color color_11 = colorUnselected;
Color color_12 = colorUnselected;

class ProductTypeWidgetScreen extends StatefulWidget {
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
    color_11 = colorUnselected;
    color_12 = colorUnselected;
  }
  @override
  _ProductTypeWidgetScreenState createState() =>
      _ProductTypeWidgetScreenState();
}

class _ProductTypeWidgetScreenState extends State<ProductTypeWidgetScreen> {

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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Packaged/ Consumer boxes');
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Food and agriculture');
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Machine/Auto Parts');
    } else if (cardNumber == 4 && color_4 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Electronic goods');
    } else if (cardNumber == 5 && color_5 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Chemical / Powder');
    } else if (cardNumber == 6 && color_6 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Scrap');
    } else if (cardNumber == 7 && color_7 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Construction material');
    } else if (cardNumber == 8 && color_8 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Petroleum / Paint');
    } else if (cardNumber == 9 && color_9 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Tyre');
    } else if (cardNumber == 10 && color_10 == colorUnselected) {
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
      color_11 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Battery');
    } else if (cardNumber == 11 && color_11 == colorUnselected) {
      color_11 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      color_1 = colorUnselected;
      color_12 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
          .updateProductType(newValue: 'Cylinders');
    } else if (cardNumber == 12 && color_12 == colorUnselected) {
      color_12 = colorSelected;
      color_2 = colorUnselected;
      color_3 = colorUnselected;
      color_4 = colorUnselected;
      color_5 = colorUnselected;
      color_6 = colorUnselected;
      color_7 = colorUnselected;
      color_8 = colorUnselected;
      color_9 = colorUnselected;
      color_10 = colorUnselected;
      color_11 = colorUnselected;
      color_1 = colorUnselected;
      Provider.of<NewDataByShipper>(context, listen: false)
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
          invertAllColor(cardNumber);
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
