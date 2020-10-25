import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/Screens/home_screens.dart';
import 'package:menuapp/Screens/maps_screen.dart';
import 'package:menuapp/Screens/aboutus_screens.dart';

class NavBar extends StatefulWidget {
  NavBar({this.selectedIndex});
  int selectedIndex;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.transparent,
        selectedItemBackgroundColor: Colors.green,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
      ),
      selectedIndex: widget.selectedIndex,
      onSelectTab: (index) {
        setState(() {
          widget.selectedIndex = index;
          if (widget.selectedIndex == 0) {
            Navigator.pushNamed(context, HomeScreen.id);
          }
          if (widget.selectedIndex == 1) {
            Navigator.pushNamed(context, MapsScreen.id);
          }
          if (widget.selectedIndex == 2) {
            Navigator.pushNamed(context, AboutUs.id);
          }
        });
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.list,
          label: 'List',
        ),
        FFNavigationBarItem(
          iconData: Icons.map,
          label: 'Map',
          selectedBackgroundColor: Colors.orange,
        ),
        FFNavigationBarItem(
          iconData: Icons.info,
          label: 'About Us',
          selectedBackgroundColor: Colors.purple,
        ),
      ],
    );
  }
}
