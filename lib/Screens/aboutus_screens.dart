import 'package:flutter/material.dart';
import 'package:menuapp/Component/navbar.dart';

class AboutUs extends StatefulWidget {
  static const String id = "about_screen";

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed by Faris Dahleh",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text("🎉 SPECIAL THANKS TO Disease.sh for the open API 🎉"),
          ],
        ),
      ),
      bottomNavigationBar: Hero(
        tag: "Nav",
              child: NavBar(
          selectedIndex: 2,
        ),
      ),
    );
  }
}
