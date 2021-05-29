
import 'package:Liveasy/providers/auth_provider.dart';
import 'package:Liveasy/providers/providerdata.dart';
import 'package:Liveasy/screens/demo.dart';
import 'package:Liveasy/screens/new_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/getxcontrollers/timer_controller.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }        
      },
      child: ChangeNotifierProvider<ProviderData>(
        create: (context) => ProviderData(),
        child: GetMaterialApp(
        theme: ThemeData(),
        home: NewLoginScreen(),

        ),
      ),
    );
  }
}

