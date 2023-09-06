import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/screen/homescreen.dart';

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
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Notification",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.027,),),
          ],
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.025 ),
          child: Column(
            children: [
              Image.asset("assets/notification/eventreminder.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/thankyou.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/newproductlauch.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/specialoffer.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/communityupdate.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/specialoffer.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/thankyou.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/communityupdate.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/eventreminder.png"),
              SizedBox(height:MediaQuery.of(context).size.height*.025  ,),
              Image.asset("assets/notification/newproductlauch.png"),
            ],
          ),
        ),
      ),
    );
  }
}
