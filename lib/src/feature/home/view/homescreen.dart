import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/home/view/widgets/Home.dart';
import 'package:growlife/src/feature/post/view/camera.dart';
import 'package:growlife/src/feature/post/view/widgets/click.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  static const routePath="/homescreen";

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
            elevation: 0,
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem("HOME", 0, navigationProvider,IconAssets.homewhite,
                    IconAssets.home),
                _buildNavItem( "SHOP", 1, navigationProvider,IconAssets.shopwhite,
                    IconAssets.shop),
                _buildNavItem( "POST", 2, navigationProvider,IconAssets.addwhite,
                    IconAssets.add),
                _buildNavItem( "EVENT", 3, navigationProvider,IconAssets.eventwhite,
                    IconAssets.event),
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

  Widget _buildNavItem(String label, int index, NavigationProvider provider, String selectedImageAsset, String unselectedImageAsset) {
    bool isSelected = provider.selectedIndex == index;
    double translateY = isSelected ? -35.0 : -0.0; // Move icon up when selected

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
              child:

              Image.asset(
                isSelected ? selectedImageAsset : unselectedImageAsset,
                width: 30, // Set the width and height as needed
                height: 30,
              ),
            ),

            SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.lato(
                color: isSelected ? Color(0xFF1F588E) : Colors.white,
                fontSize:  MediaQuery.of(context).size.height*.019,
              ),
            ),
          ],
        ),
      ),
    );
  }
}