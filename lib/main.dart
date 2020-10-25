import 'package:flutter/material.dart';
import 'package:menuapp/Screens/aboutus_screens.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/home_screens.dart';
import 'Screens/maps_screen.dart';

Future main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MapsScreen.id: (context) => MapsScreen(),
        AboutUs.id: (context) => AboutUs(),
      },
    );
  }
}
