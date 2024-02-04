import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';
import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/term_condition/view/term&condition.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';

import '../../../aboutus/view/aboutus.dart';

class HelpQuestion extends StatefulWidget {


  const HelpQuestion({Key? key}) : super(key: key);
  static const routePath="/helpquestion";
  @override
  State<HelpQuestion> createState() => _HelpQuestionState();
}

class _HelpQuestionState extends State<HelpQuestion> {
  bool isSelectedlike=true;
  bool isSelecteddislike=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CommonAppBar(title: "Help Center"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical: MediaQuery.of(context).size.height*.01 ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Feature",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.blue)),
                      Icon(Icons.arrow_forward_ios,color: Colors.black,size:16,),
                      Text("Events & Donation",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.025,),
                  Text("How can I join an event through the app?",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize:20 ),),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Text("To join an event through the app, follow these simple steps:",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. ",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('Open the app and navigate to the "Events" section. 📅',style: GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2. ",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Browse through the list of available events and find the one you're interested in. 🌱",style: GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3. ",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Tap on the event to view more details,including the date, time, and location.📍",style:  GoogleFonts.plusJakartaSans(fontSize:18),),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4. ",style:  GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('If registration is required, look for the "Join" or "Register" button and tap on it.',style: GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5. ",style:  GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('Fill in any necessary information, such as your name, contact details, or any specific requirements. ✍️',style:  GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("6. ",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Once you've provided the required information, confirm your attendance by submitting your registration. ✔️",style:  GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("7. ",style: GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("You may receive a confirmation message or email with further instructions, event reminders, or any additional details you need to know. 📩",style:  GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8. ",style:  GoogleFonts.plusJakartaSans(fontSize:18),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("On the day of the event, make sure to arrive at the designated location on time and ready to participate. Enjoy the event and make a positive impact! 🌿",style:  GoogleFonts.plusJakartaSans(fontSize:18),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.025 ,),
                      Expanded(child: Text("If you have any specific questions or encounter any issues during the event registration process, don't hesitate to reach out to our support team for assistance. We're here to help! 🤝",style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Container(
                    height: MediaQuery.of(context).size.height*.105,
                    width:  MediaQuery.of(context).size.width*.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.02),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: Colors.blueGrey
                        )
                      ]
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height*.005),
                      child: Column(
                        children: [
                          Text("Was this helpful ?",style: GoogleFonts.plusJakartaSans(fontSize:16),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon:isSelectedlike?Icon(Icons.thumb_up_alt_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.03,):Icon(Icons.thumb_up,color: Colors.blue,size:  MediaQuery.of(context).size.height*.03,),
                                onPressed: () {
                                  setState(() {
                                    isSelectedlike=! isSelectedlike;
                                  });
                                },),
                              SizedBox(width:MediaQuery.of(context).size.height*.025 ,),
                              IconButton(
                                icon:isSelecteddislike?Icon(Icons.thumb_down_alt_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.03,):Icon(Icons.thumb_down,color: Colors.blue,size:  MediaQuery.of(context).size.height*.03,),
                                onPressed: () {
                                  setState(() {
                                    isSelecteddislike=! isSelecteddislike;
                                  });
                                },
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),



                ],
              ),
            ),
            const BottomContainer()
          ],
        ),
      ),
    );
  }
}