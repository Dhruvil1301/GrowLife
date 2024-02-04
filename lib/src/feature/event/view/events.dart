import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/event/view/widgets/eventdetails.dart';
import 'package:growlife/src/feature/event/view/widgets/eventlist.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';


import '../../home/view/homescreen.dart';
class Events extends StatefulWidget {

  const Events({Key? key}) : super(key: key);
  static const routePath="/events";
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
        appBar: CommonAppBar(title: "Events"),
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
                    Text("Upcoming Events", style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 18),),
                    Text("Show all", style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black38),),

                  ],
                ),
              ),
                 EventList(image: EventAssets.ev1 , time: "Saturday, Jul 22 , 10:00 AM", title: "Green Fest: Planting the Seeds of Change", location: "Mumbai",onTap: (){
                  router.push(EventDetails.routePath);
                },),
              const EventList(image: EventAssets.ev2 , time: "Sunday, Aug 19 , 11:00 AM", title: "Roots and Shoots :Tree- Planting Workshop", location: "Bengaluru"),
              const EventList(image: EventAssets.ev3 , time: "Sunday, Sep 10 , 12:30 AM", title: "Eco Awareness Seminar", location: "Delhi"),
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
                    Text("Ongoing Event", style:GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 18),),

                  ],
                ),
              ),
              const EventList(image: EventAssets.ev4 , time: "Saturday, Jul 22 , 10:00 AM", title: "Green Fest: Planting the Seeds of Change", location: "Mumbai"),
              const EventList(image: EventAssets.ev5 , time: "Sunday, Aug 19 , 11:00 AM", title: "Roots and Shoots :Tree- Planting Workshop", location: "Bengaluru"),
              const EventList(image: EventAssets.ev6 , time: "Sunday, Sep 10 , 12:30 AM", title: "Eco Awareness Seminar", location: "Delhi"),
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
