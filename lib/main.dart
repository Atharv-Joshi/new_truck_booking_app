import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/models/providerData.dart';
import 'package:Liveasy/screens/shipperOrTransporterChoiceScreen.dart';
import 'package:http/http.dart' as http;
import 'package:Liveasy/screens/loginScreens/shipperLoginScreen.dart';
import 'package:Liveasy/screens/loginScreens/transporterLoginScreen.dart';
import 'package:Liveasy/screens/transporterScreens/transporterHomeScreen.dart';
import 'package:Liveasy/screens/shipperScreens/shipperHomeScreen.dart';

void main() async{
  runApp(MyApp());
}

Future<String> getUserDetails(String mobileNum) async {
  http.Response response =
      await http.get("http://15.206.217.236:2000/users/$mobileNum");
  return response.body;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderData>(
      create: (context) => ProviderData(),
      child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Loading();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (FirebaseAuth.instance.currentUser == null) {
                return MaterialApp(
                  home: ChoiceScreen(),
                  routes: {
                    '/choice': (context) => ChoiceScreen(),
                    '/login1': (context) => ShipperLoginScreen(),
                    '/login2': (context) => TransporterLoginScreen(),
                    '/home': (context) => ShipperHomeScreen(
                          user: FirebaseAuth.instance.currentUser,
                        ),
                    '/tsHome': (context) => TsHomeScreen(
                          user: FirebaseAuth.instance.currentUser,
                        ),
                  },
                );
              }
              return FutureBuilder(
                  future: getUserDetails(
                      FirebaseAuth.instance.currentUser.phoneNumber),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final String userType = snapshot.data;
                    print(userType);
                    Widget initialScreen = ChoiceScreen();
                    if (userType == "shipper") {
                      initialScreen = ShipperHomeScreen(
                        user: FirebaseAuth.instance.currentUser,
                      );
                    } else if (userType == "transporter") {
                      initialScreen = TsHomeScreen(
                        user: FirebaseAuth.instance.currentUser,
                      );
                    }
                    return MaterialApp(
                      home: initialScreen,
                      routes: {
                        '/choice': (context) => ChoiceScreen(),
                        '/login1': (context) => ShipperLoginScreen(),
                        '/login2': (context) => TransporterLoginScreen(),
                        '/home': (context) => ShipperHomeScreen(
                              user: FirebaseAuth.instance.currentUser,
                            ),
                        '/tsHome': (context) => TsHomeScreen(
                              user: FirebaseAuth.instance.currentUser,
                            ),
                      },
                    );
                  });
            }
            return Loading();
          }),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF3F2F1),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'OOPS!!\n Some Error With The App, \nEither Wait OR Please Try Again Later',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.error,
                  size: 70,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
