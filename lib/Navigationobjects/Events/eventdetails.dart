import 'dart:ui';

import 'package:growlife/Navigationobjects/Events/Donation.dart';
import 'package:growlife/Navigationobjects/Events/registration.dart';

import 'events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Events()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
                Text("Event Details",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
                SizedBox(width:  MediaQuery.of(context).size.height*.14,),
                Icon(Icons.more_horiz,size: MediaQuery.of(context).size.height*.035 ,color: Colors.black,)


          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/events/evd1.png"),
                Positioned(
                  top: MediaQuery.of(context).size.height*.122,
                    child:
                Center(
                  child: Container(
                    width:MediaQuery.of(context).size.width*1 ,
                    height: MediaQuery.of(context).size.height*.08,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.5), // Adjust the color and opacity as needed
                          child: Center(
                            child: Column(
                              children: [
                                Text("Green Fest:",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.028),),
                                Text("Planting the Seeds of Change",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.028),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )

                )
              ],
            ),

            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.02),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                  child: Text("Green Fest: Planting the Seeds of Change",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.02),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Event by Growlife",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02, ),)),
            ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
               child: Container(
            alignment: AlignmentDirectional.topStart,
               child: Row(
                 children: [
                   Icon(Icons.calendar_today_sharp,color: Colors.black38,size:MediaQuery.of(context).size.height*.02 ,),
                   SizedBox(width: MediaQuery.of(context).size.height*.01,),
                   Text("Saturday, Jul 22 - Jul 30 , 10:00 AM IST",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.018,color: Colors.black38 ),),
                 ],
               )),
             ),
            SizedBox(height: MediaQuery.of(context).size.height*.007,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.black38,size:MediaQuery.of(context).size.height*.02 ,),
                      SizedBox(width: MediaQuery.of(context).size.height*.01,),
                      Text("Mumbai",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.018,color: Colors.black38 ),),
                    ],
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.15),
              child: Image.asset("assets/events/evd2.png",height:MediaQuery.of(context).size.height*.04,width: MediaQuery.of(context).size.width*.6,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*.045 ,
                    width: MediaQuery.of(context).size.width*.24 ,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.5,
                            color: Color(0xFF1F588E)
                        )
                    ),
                    child: Center(child: Text("Join Us",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Donation()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*.045 ,
                    width: MediaQuery.of(context).size.width*.23 ,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.5,
                            color: Color(0xFF1F588E)
                        )
                    ),
                    child: Center(child: Text("Donate",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/shop/wishlisticon.png",
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                )


              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Details",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.03 ),
              child:Text.rich(
                TextSpan(
                  text: "Join us for the much-anticipated event, \"Green Fest: Planting the Seeds of Change,\" a transformative ",
                  style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.0179),
                  children: [
                    TextSpan(
                      text: "9 Day celebration",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " dedicated to environmental conservation and tree plantation. "),
                    TextSpan(
                      text: "Read more",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              )

            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01,vertical:  MediaQuery.of(context).size.height*.02 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Other events for you",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.025 ),),
                  Text("Show all",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.02,color: Colors.black38 ),),

                ],
              ),
            ),
            for(int i=0;i<3;i++)
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.01,vertical:  MediaQuery.of(context).size.height*.01 ),
                    child: Container(
                      child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[ i == 0
                              ? Padding(
                            padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height * 0.006 ),
                            child: Image.asset(
                              "assets/events/ev4.png",
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                          )
                              : i == 1
                              ? Padding(
                            padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height * 0.006 ),
                            child: Image.asset(
                              "assets/events/ev5.png",
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                          )
                              : Padding(
                            padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height * 0.006),
                            child: Image.asset(
                              "assets/events/ev6.png",
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                          ),
                            i==0?Expanded(
                              child: Column(
                                children: [
                                  Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text("Saturday, Jul 22 , 10:00 AM",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Text("Green Fest: Planting the Seeds of Change",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02 ),),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,color: Colors.red.shade600,size: MediaQuery.of(context).size.height * 0.03 ,),
                                      Text("Mumbai",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)
                                    ],
                                  )
                                ],
                              ),
                            ):
                            i==1?Expanded(
                              child: Column(
                                children: [
                                  Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text("Sunday, Aug 19 , 11:00 AM",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text("Roots and Shoots :Tree- Planting Workshop",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02 ),)),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,color: Colors.red.shade600,size: MediaQuery.of(context).size.height * 0.03 ,),
                                      Text("Bengaluru",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)
                                    ],
                                  )
                                ],
                              ),
                            ):
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text("Sunday, Sep 10 , 12:30 AM",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text("Eco Awareness Seminar",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02 ),)),
                                  SizedBox(height:MediaQuery.of(context).size.height * 0.008,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,color: Colors.red.shade600,size: MediaQuery.of(context).size.height * 0.03 ,),
                                      Text("Delhi",style: GoogleFonts.lato(color: Colors.black38,fontSize: MediaQuery.of(context).size.height * 0.02 ),)
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
    );
  }
}
