import 'dart:ui';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/event/view/widgets/Donation.dart';
import 'package:growlife/src/feature/event/view/widgets/eventlist.dart';
import 'package:growlife/src/feature/event/view/widgets/registration.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';

import '../events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EventDetails extends StatefulWidget {

  const EventDetails({Key? key}) : super(key: key);
  static const routePath="/eventdetails";
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   CommonAppBar(
        title: "Event Details",
        action: [
          IconButton(onPressed: (){

          },
              icon:const Icon(Icons.more_horiz) )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(EventAssets.evd1),
                Positioned(
                  top: MediaQuery.of(context).size.height*.122,
                    child:
                Center(
                  child: Container(
                    width:MediaQuery.of(context).size.width*1 ,
                    height: MediaQuery.of(context).size.height*.085,
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
                                Text("Green Fest:\n Planting the Seeds of Change",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize:  22,),textAlign: TextAlign.center,),

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
                  child: Text("Green Fest: Planting the Seeds of Change",style: GoogleFonts.poppins(fontSize:22,fontWeight: FontWeight.w600 ),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.02),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Event by Growlife",style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w400 ),)),
            ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
               child: Container(
            alignment: AlignmentDirectional.topStart,
               child: Row(
                 children: [
                   Icon(Icons.calendar_today_sharp,color: Colors.black38,size:MediaQuery.of(context).size.height*.02 ,),
                   SizedBox(width: MediaQuery.of(context).size.height*.01,),
                   Text("Saturday, Jul 22 - Jul 30 ,10:00 AM IST",style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400,color: Colors.black38 ),),
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
                      Text("Mumbai",style:  GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400,color: Colors.black38 ),),
                    ],
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.15),
              child: Image.asset(EventAssets.evd2,height:MediaQuery.of(context).size.height*.04,width: MediaQuery.of(context).size.width*.6,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                InkWell(
                  onTap: (){
                    router.push(Registration.routePath);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*.045 ,
                    width: MediaQuery.of(context).size.width*.24 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          width: 1.5,
                            color: AppColor.primary
                        )
                    ),
                    child: Center(child: Text("Join Us",style:  GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w600,color: AppColor.primary ),)),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                InkWell(
                  onTap: (){
                   router.push(Donation.routePath);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*.045 ,
                    width: MediaQuery.of(context).size.width*.23 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          width: 1.5,
                            color: const Color(0xFF1F588E)
                        )
                    ),
                    child: Center(child: Text("Donate",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w600,color: AppColor.primary ),)),
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
                      ShopAssets.wishlisticon,
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
                  child: Text("Details",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w600 ),)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.03 ),
              child:Text.rich(
                TextSpan(
                  text: "Join us for the much-anticipated event, \"Green Fest: Planting the Seeds of Change,\" a transformative ",
                  style:GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14),
                  children:  [
                    TextSpan(
                      text: "9 Day celebration",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),
                    ),
                    TextSpan(text: " dedicated to environmental conservation and tree plantation. "),
                    TextSpan(
                      text: "Read more",
                      style:GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.blue,fontSize: 14)
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
                  Text("Other events for you",style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700, fontSize: 18),),
                  Text("Show all",style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black38),),

                ],
              ),
            ),
            const EventList(image: EventAssets.ev4 , time: "Saturday, Jul 22 , 10:00 AM", title: "Green Fest: Planting the Seeds of Change", location: "Mumbai"),
            const EventList(image: EventAssets.ev5 , time: "Sunday, Aug 19 , 11:00 AM", title: "Roots and Shoots :Tree- Planting Workshop", location: "Bengaluru"),
            const EventList(image: EventAssets.ev6 , time: "Sunday, Sep 10 , 12:30 AM", title: "Eco Awareness Seminar", location: "Delhi"),
          ],
        ),
      ),
    );
  }
}
