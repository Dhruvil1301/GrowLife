import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/res/assets.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   CommonAppBar(title: "Notification"),
      body: SingleChildScrollView(

        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.00,horizontal:MediaQuery.of(context).size.height*.015  ),
          child: Column(
            children: [
              Image.asset(NotificationAssets.eventreminder),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.thankyou),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.newproductlaunch),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.specialoffer),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.community),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.specialoffer),
              SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
              Image.asset(NotificationAssets.thankyou),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.community),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.eventreminder),
              SizedBox(height:MediaQuery.of(context).size.height*.02  ,),
              Image.asset(NotificationAssets.newproductlaunch),
            ],
          ),
        ),
      ),
    );
  }
}
