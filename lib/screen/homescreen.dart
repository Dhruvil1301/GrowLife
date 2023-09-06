import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/Events/events.dart';
import 'package:growlife/Navigationobjects/post/camera.dart';
import 'package:growlife/Navigationobjects/post/click.dart';
import 'package:growlife/Navigationobjects/shop/shopping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../Navigationobjects/Home/Home.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(navigationProvider.selectedIndex),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, "HOME", 0, navigationProvider),
                _buildNavItem(Icons.add_business, "SHOP", 1, navigationProvider),
                 _buildNavItem(Icons.add_circle_outline_outlined, "POST", 2, navigationProvider),
                _buildNavItem(Icons.shopping_bag, "EVENT", 3, navigationProvider),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Shopping(),
    Click(),
    Events(),
  ];

  Widget _buildNavItem(IconData icon, String label, int index, NavigationProvider provider) {
    bool isSelected = provider.selectedIndex == index;
    double translateY = isSelected ? -25.0 : 0.0; // Move icon up when selected

    return GestureDetector(
      onTap: () {
        // Update the selected index when an icon is tapped
        provider.selectedIndex = index;

        if (index == 2) {
          // Navigate to the Camera widget
          Navigator.push(context, MaterialPageRoute(builder: (context) => Camera())).then((value) {
            // Handle navigation back from Camera widget
            if (value != null && value is int && value == 0) {
              // If value is 0, set the selectedIndex to 0 (Home)
              provider.selectedIndex = 0;
            }
          });
        }
      },
      child: Transform.translate(
        offset: Offset(0, translateY),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: isSelected ? Color(0xFF1F588E) : Colors.transparent,
              radius: 25,
              child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.lato(
                color: isSelected ? Color(0xFF1F588E) : Colors.white,
                fontSize:  MediaQuery.of(context).size.height*.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

