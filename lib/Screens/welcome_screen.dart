import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'home_screens.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  void timer() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      setState(() {
        Navigator.pushNamed(context, HomeScreen.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 100.0,
        ),
      ),
    );
  }
}
