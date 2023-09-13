import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/Events/eventdetails.dart';
import 'package:growlife/Navigationobjects/Home/Home.dart';

import '../../screen/homescreen.dart';
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final exit = await showExitConfirmationDialog(context);
        return exit ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Icon(
                    Icons.arrow_back, color: Colors.black, size: MediaQuery
                      .of(context)
                      .size
                      .height * .035,)),
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .height * .030,),
              Text("Events", style: GoogleFonts.lato(
                color: Colors.black, fontSize: MediaQuery
                  .of(context)
                  .size
                  .height * .03,),),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * .025, left: MediaQuery
                    .of(context)
                    .size
                    .height * .025, right: MediaQuery
                    .of(context)
                    .size
                    .height * .025),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search Event",
                    hintStyle: GoogleFonts.lato(fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * .023),
                    prefixIcon: Icon(Icons.search, size: MediaQuery
                        .of(context)
                        .size
                        .height * .035,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery
                    .of(context)
                    .size
                    .height * .01, vertical: MediaQuery
                    .of(context)
                    .size
                    .height * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Events", style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * .028),),
                    Text("Show all", style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * .022, color: Colors.black38),),

                  ],
                ),
              ),
              for(int i = 0; i < 3; i++)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .height * .01, vertical: MediaQuery
                          .of(context)
                          .size
                          .height * .01),
                      child: InkWell(
                        onTap: () {
                          if (i == 0) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => EventDetails()));
                          }
                        },
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ i == 0
                                  ? Padding(
                                padding: EdgeInsets.only(right: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.006),
                                child: Image.asset(
                                  "assets/events/ev1.png",
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.12,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.35,
                                ),
                              )
                                  : i == 1
                                  ? Padding(
                                padding: EdgeInsets.only(right: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.006),
                                child: Image.asset(
                                  "assets/events/ev2.png",
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.12,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.35,
                                ),
                              )
                                  : Padding(
                                padding: EdgeInsets.only(right: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.006),
                                child: Image.asset(
                                  "assets/events/ev3.png",
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.12,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.35,
                                ),
                              ),
                                i == 0 ? Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: AlignmentDirectional
                                              .topStart,
                                          child: Text(
                                            "Saturday, Jul 22 , 10:00 AM",
                                            style: GoogleFonts.lato(
                                                color: Colors.black38,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Text(
                                        "Green Fest: Planting the Seeds of Change",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.02),),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Icon(Icons.location_on,
                                            color: Colors.red.shade600,
                                            size: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.03,),
                                          Text("Mumbai",
                                            style: GoogleFonts.lato(
                                                color: Colors.black38,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)
                                        ],
                                      )
                                    ],
                                  ),
                                ) :
                                i == 1 ? Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: AlignmentDirectional
                                              .topStart,
                                          child: Text(
                                            "Sunday, Aug 19 , 11:00 AM",
                                            style: GoogleFonts.lato(
                                                color: Colors.black38,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Container(
                                          alignment: AlignmentDirectional
                                              .topStart,
                                          child: Text(
                                            "Roots and Shoots :Tree- Planting Workshop",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Icon(Icons.location_on,
                                            color: Colors.red.shade600,
                                            size: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.03,),
                                          Text("Bengaluru",
                                            style: GoogleFonts.lato(
                                                color: Colors.black38,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)
                                        ],
                                      )
                                    ],
                                  ),
                                ) :
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: AlignmentDirectional
                                              .topStart,
                                          child: Text(
                                            "Sunday, Sep 10 , 12:30 AM",
                                            style: GoogleFonts.lato(
                                                color: Colors.black38,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Container(
                                          alignment: AlignmentDirectional
                                              .topStart,
                                          child: Text("Eco Awareness Seminar",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.02),)),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.008,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Icon(Icons.location_on,
                                            color: Colors.red.shade600,
                                            size: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.03,),
                                          Text("Delhi", style: GoogleFonts.lato(
                                              color: Colors.black38,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)
                                        ],
                                      )
                                    ],
                                  ),
                                )


                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery
                    .of(context)
                    .size
                    .height * .01, vertical: MediaQuery
                    .of(context)
                    .size
                    .height * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ongoing Event", style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * .028),),

                  ],
                ),
              ),
              for(int i = 0; i < 3; i++)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .height * .01, vertical: MediaQuery
                          .of(context)
                          .size
                          .height * .01),
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [ i == 0
                                ? Padding(
                              padding: EdgeInsets.only(right: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.006),
                              child: Image.asset(
                                "assets/events/ev4.png",
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.12,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.35,
                              ),
                            )
                                : i == 1
                                ? Padding(
                              padding: EdgeInsets.only(right: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.006),
                              child: Image.asset(
                                "assets/events/ev5.png",
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.12,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.35,
                              ),
                            )
                                : Padding(
                              padding: EdgeInsets.only(right: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.006),
                              child: Image.asset(
                                "assets/events/ev6.png",
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.12,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.35,
                              ),
                            ),
                              i == 0 ? Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: AlignmentDirectional
                                            .topStart,
                                        child: Text(
                                          "Saturday, Jul 22 , 10:00 AM",
                                          style: GoogleFonts.lato(
                                              color: Colors.black38,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Text(
                                      "Green Fest: Planting the Seeds of Change",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.02),),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Icon(Icons.location_on,
                                          color: Colors.red.shade600,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.03,),
                                        Text("Mumbai", style: GoogleFonts.lato(
                                            color: Colors.black38,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.02),)
                                      ],
                                    )
                                  ],
                                ),
                              ) :
                              i == 1 ? Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: AlignmentDirectional
                                            .topStart,
                                        child: Text("Sunday, Aug 19 , 11:00 AM",
                                          style: GoogleFonts.lato(
                                              color: Colors.black38,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Container(
                                        alignment: AlignmentDirectional
                                            .topStart,
                                        child: Text(
                                          "Roots and Shoots :Tree- Planting Workshop",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Icon(Icons.location_on,
                                          color: Colors.red.shade600,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.03,),
                                        Text("Bengaluru",
                                          style: GoogleFonts.lato(
                                              color: Colors.black38,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)
                                      ],
                                    )
                                  ],
                                ),
                              ) :
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: AlignmentDirectional
                                            .topStart,
                                        child: Text("Sunday, Sep 10 , 12:30 AM",
                                          style: GoogleFonts.lato(
                                              color: Colors.black38,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Container(
                                        alignment: AlignmentDirectional
                                            .topStart,
                                        child: Text("Eco Awareness Seminar",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * 0.02),)),
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.008,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Icon(Icons.location_on,
                                          color: Colors.red.shade600,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.03,),
                                        Text("Delhi", style: GoogleFonts.lato(
                                            color: Colors.black38,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.02),)
                                      ],
                                    )
                                  ],
                                ),
                              )


                            ]
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
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
