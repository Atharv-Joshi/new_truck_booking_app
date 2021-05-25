import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/screens/new_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:Liveasy/screens/new_loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';


// class FlashChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<NewDataByShipper>(
//       create: (context) => NewDataByShipper(),
//       child: FutureBuilder(
//           future: Firebase.initializeApp(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return loading();
//             }
//             if (snapshot.connectionState == ConnectionState.done) {
//               return MaterialApp(
//                 initialRoute:
//                     FirebaseAuth.instance.currentUser == null ? '/' : '/home',
//                 routes: {
//                   '/': (context) => ChoiceScreen(),
//                   '/login1': (context) => ShipperLoginScreen(),
//                   '/login2': (context) => TransporterLoginScreen(),
//                   '/newEntry': (context) => ShipperNewEntryScreen(),
//                   '/cards': (context) => CardScreen(),
//                   '/home': (context) => ShipperHomeScreen(
//                         user: FirebaseAuth.instance.currentUser,
//                       ),
//                   '/tsHome' : (context) => TsHomeScreen( user: FirebaseAuth.instance.currentUser,),
//                   '/findLoad' : (context) => TsFindLoadScreen(),
//                   '/maps' : (context) => MapScreen(),
//                   '/product' : (context) => LoadingPointSearchScreen(),
//                   'found_loads' : (context) => TsFoundLoadsScreen(),
//                 },
//               );
//             }
//             return loading();
//           }),
//     );
//   }
// }

// class loading extends StatelessWidget {

// import 'package:provider/provider.dart';
// import 'package:Liveasy/screens/mapScreen.dart';
// import 'package:Liveasy/screens/transporter_find_load.dart';
// import 'package:Liveasy/screens/transporter_found_loads.dart';
// import 'package:Liveasy/widgets/LoadingPointSeachScreen.dart';
// import 'widgets/providerData.dart';
// import 'package:Liveasy/screens/shipper_login_screen.dart';
// import 'package:Liveasy/screens/choice_screen.dart';
// import 'package:Liveasy/screens/transporter_login_screen.dart';
// import 'package:Liveasy/screens/shipper_new_entry.dart';
// import 'package:Liveasy/screens/cardGenerator.dart';
// import 'package:Liveasy/screens/shipper_home_Screen.dart';
// import 'package:Liveasy/screens/transporter_home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: NewLoginScreen.routeName,
      routes: {
        Demo.routeName : (ctx) => Demo(),
        NewLoginScreen.routeName: (ctx) => NewLoginScreen(),
        // NewOTPVerificationScreen.routeName : (ctx) => NewOTPVerificationScreen(),
        NewLoadingScreen.routeName: (ctx) => NewLoadingScreen()
      },
    );

    // return ChangeNotifierProvider<NewDataByShipper>(
    //   create: (context) => NewDataByShipper(),
    //   child: FutureBuilder(
    //       future: Firebase.initializeApp(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasError) {
    //           return Loading();
    //         }
    //         if (snapshot.connectionState == ConnectionState.done) {
    //           return MaterialApp(
    //             initialRoute:
    //                 FirebaseAuth.instance.currentUser == null ? '/' : '/home',
    //             routes: {
    //               '/': (context) => ChoiceScreen(),
    //               '/login1': (context) => ShipperLoginScreen(),
    //               '/login2': (context) => TransporterLoginScreen(),
    //               '/newEntry': (context) => ShipperNewEntryScreen(),
    //               '/cards': (context) => CardScreen(),
    //               '/home': (context) => ShipperHomeScreen(
    //                     user: FirebaseAuth.instance.currentUser,
    //                   ),
    //               '/tsHome' : (context) => TsHomeScreen( user: FirebaseAuth.instance.currentUser,),
    //               '/findLoad' : (context) => TsFindLoadScreen(),
    //               '/maps' : (context) => MapScreen(),
    //               '/product' : (context) => LoadingPointSearchScreen(),
    //               'found_loads' : (context) => TsFoundLoadsScreen(),
    //             },
    //           );
    //         }
    //         return Loading();
    //       }),
    // );
  }
}

// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xFFF3F2F1),
//         body: Center(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'OOPS!!\n Some Error With The App, \nEither Wait OR Please Try Again Later',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Icon(
//                   Icons.error,
//                   size: 70,
//                   color: Colors.red,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
