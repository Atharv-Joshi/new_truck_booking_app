import 'package:Liveasy/screens/loginScreens/transporterLoginScreen.dart';
import 'package:Liveasy/screens/loginScreens/shipperLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationDisabledScreen extends StatefulWidget {
  @override
  _LocationDisabledScreenState createState() => _LocationDisabledScreenState();
}

class _LocationDisabledScreenState extends State<LocationDisabledScreen> {
  checkIfLocationPermissionGiven() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    print(permission);
    if (permission == PermissionStatus.granted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChoiceScreen()));
    }
  }

  Future<bool> checkIfPermissionGiven() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    print("permission Checked");
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  checkIfLocationPermissionGiven();
                },
                child: Text(
                  "Refresh",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  await LocationPermissions().openAppSettings();
                },
                child: Text(
                  "Open Settings",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  void initState() {
    super.initState();
    getLocationPermission();
  }

  PermissionStatus permission1;
  Position userPosition;

  getLocationPermission() async {
    await LocationPermissions().requestPermissions();
    permission1 = await LocationPermissions().checkPermissionStatus();
    print(permission1);
    userPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<bool> checkIfPermissionGiven() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    if (permission != PermissionStatus.granted) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (permission1 == PermissionStatus.denied ||
        permission1 == PermissionStatus.restricted) {
      return LocationDisabledScreen();
    }
    return MaterialApp(
      theme: ThemeData.dark(),
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xFFF3F2F1),
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Center(
              child: Text(
                'Register Now!!',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Color(0xFFFAECEC),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.black87,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Shipper',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                            color: Color(0xFF6264A7),
                            onPressed: () async {
                              WidgetsFlutterBinding.ensureInitialized();
                              await Firebase.initializeApp();
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShipperLoginScreen(
                                            userPosition: userPosition,
                                          )));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 100,),
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Color(0xFFFAECEC),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.construction,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.black87,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Transporter',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                            color: Color(0xFF6264A7),
                            onPressed: () async {
                              WidgetsFlutterBinding.ensureInitialized();
                              await Firebase.initializeApp();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransporterLoginScreen(
                                            userPosition: userPosition,
                                          )));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
