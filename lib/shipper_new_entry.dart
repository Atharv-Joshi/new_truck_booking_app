import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cardGenerator.dart';
import 'package:provider/provider.dart';

String productType;
String loadingPoint;
String unloadingPoint;
String truckPreference;
String noOfTrucks = '1';
String weight;
bool isPending = true;
String comments;
bool isCommentsEmpty = true;
var controller1 = TextEditingController();
var controller2 = TextEditingController();
var controller3 = TextEditingController();
class ShipperNewEntryScreen extends StatefulWidget {
  @override
  _ShipperNewEntryScreenState createState() => _ShipperNewEntryScreenState();
}

class _ShipperNewEntryScreenState extends State<ShipperNewEntryScreen> {
  @override
  void initState() {
    super.initState();
    controller1.clear();
    controller2.clear();
    controller3.clear();
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shipping Details'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            autovalidate: true,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 20,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: controller1,
                              onChanged: (newValue) {
                                loadingPoint = newValue;
                              },
                              decoration: InputDecoration(
                                labelText: 'Loading Point',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Loading Point is Required';
                                } else
                                  return null;
                              },
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: controller2,
                              onChanged: (newValue) {
                                unloadingPoint = newValue;
                              },
                              decoration: InputDecoration(
                                labelText: 'Unloading Point',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Unloading Point is Required';
                                } else
                                  return null;
                              },
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: DropDownGenerator(
                              dropdownValue: 'Product Type',
                              dropdownValues: [
                                'Product Type',
                                'Powder',
                                'Wire Bundles',
                                'Liquid'
                              ],
                              dropDownNumber: 'one',
                              notAllowedValue: 'Product Type',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: DropDownGenerator(
                              dropdownValue: 'Truck Preference',
                              dropdownValues: [
                                'Truck Preference',
                                'Open',
                                'Closed',
                              ],
                              dropDownNumber: 'two',
                              notAllowedValue: 'Truck Preference',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'No. Of Trucks                                  ',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Expanded(
                                  child: DropDownGenerator(
                                    dropdownValue: '1',
                                    dropdownValues: [
                                      '1',
                                      '2',
                                      '3',
                                      '4',
                                      '5',
                                    ],
                                    dropDownNumber: 'three',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: DropDownGenerator(
                              dropdownValue: 'Weight (In Tons)',
                              dropdownValues: [
                                'Weight (In Tons)',
                                '10 ton',
                                '20 ton'
                              ],
                              dropDownNumber: 'four',
                              notAllowedValue: 'Weight (In Tons)',
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: controller3,
                              onChanged: (newValue) {
                                comments = newValue;
                              },
                              decoration: InputDecoration(
                                hintText: 'Comments',
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  child: FlatButton(
                    onPressed: () {
                      if (!formKey.currentState.validate()) {
                        return;
                      }
                      if (comments != null) {
                        if (comments.isNotEmpty) {
                          if (comments != '') {
                            isCommentsEmpty = false;
                          } else {
                            isCommentsEmpty = true;
                          }
                        } else {
                          isCommentsEmpty = true;
                        }
                      } else {
                        isCommentsEmpty = true;
                      }
                      if (productType == 'Product Type') {
                        return;
                      }
                      try {
                        Provider.of<TasksData>(context, listen: false).addTasks(
                            productType,
                            loadingPoint,
                            unloadingPoint,
                            truckPreference,
                            noOfTrucks,
                            weight,
                            isPending,
                            comments,
                            isCommentsEmpty);
                        print(TasksData().cards.length);
                        Navigator.pushNamed(context, '/cards');
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Submit My Request',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownGenerator extends StatefulWidget {
  String dropdownValue;
  List<String> dropdownValues;
  String notAllowedValue;
  String dropDownNumber;

  DropDownGenerator(
      {this.dropdownValue,
      this.dropdownValues,
      this.dropDownNumber,
      this.notAllowedValue});

  @override
  _DropDownGeneratorState createState() => _DropDownGeneratorState();
}

class _DropDownGeneratorState extends State<DropDownGenerator> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.dropdownValue,
      elevation: 16,
      style: TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
          if (widget.dropDownNumber == 'one') {
            productType = newValue;
          } else if (widget.dropDownNumber == 'two') {
            truckPreference = newValue;
          } else if (widget.dropDownNumber == 'three') {
            noOfTrucks = newValue;
          } else if (widget.dropDownNumber == 'four') {
            weight = newValue;
          }
        });
      },
      items:
          widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (String value) {
        if (widget.notAllowedValue == null) {
          return null;
        }
        if (value != widget.notAllowedValue) {
          return null;
        } else
          return 'Loading Point is Required';
      },
    );
  }
}
