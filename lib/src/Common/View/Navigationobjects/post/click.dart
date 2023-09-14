import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Click extends StatefulWidget {
  const Click({Key? key}) : super(key: key);

  @override
  State<Click> createState() => _ClickState();
}

class _ClickState extends State<Click> with TickerProviderStateMixin {
  @override

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final exit = await showExitConfirmationDialog(context);
        return exit ?? false;
      },
      child: Container(

      ),
    );
  }
  Future showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit", style: GoogleFonts.lato(),),
          content: Text("Are you sure you want to exit the app?",
            style: GoogleFonts.lato(),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(
                    false); // Return false to cancel the exit
              },
              child: Text("No", style: GoogleFonts.lato(),),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: Text("Yes", style: GoogleFonts.lato(),),
            ),
          ],
        );
      },
    );
  }
}
