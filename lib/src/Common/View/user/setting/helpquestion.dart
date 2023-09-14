import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/Navigationobjects/Events/events.dart';
import 'package:growlife/src/Common/View/Navigationobjects/shop/shopping.dart';
import 'package:growlife/src/Common/View/user/setting/Contact.dart';
import 'package:growlife/src/Common/View/user/setting/help.dart';
import 'package:growlife/src/Common/View/user/setting/privacypolicy.dart';
import 'package:growlife/src/Common/View/user/setting/term&condition.dart';
import 'package:growlife/src/feature/homeview/homescreen.dart';

import 'aboutus.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool isSelectedlike=true;
  bool isSelecteddislike=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Help Center",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical: MediaQuery.of(context).size.height*.01 ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Feature",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF4393F2)  ),),
                      Icon(Icons.arrow_forward_ios,color: Colors.black,size:MediaQuery.of(context).size.height*.02 ,),
                      Text("Events & Donation",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF4393F2)  ),),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.025,),
                  Text("How can I join an event through the app?",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.028 ),),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Text("To join an event through the app, follow these simple steps:",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024),),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('Open the app and navigate to the "Events" section. 📅',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Browse through the list of available events and find the one you're interested in. 🌱",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Tap on the event to view more details,including the date, time, and location.📍",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('If registration is required, look for the "Join" or "Register" button and tap on it.',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text('Fill in any necessary information, such as your name, contact details, or any specific requirements. ✍️',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("6. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("Once you've provided the required information, confirm your attendance by submitting your registration. ✔️",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("7. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("You may receive a confirmation message or email with further instructions, event reminders, or any additional details you need to know. 📩",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8. ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Expanded(child: Text("On the day of the event, make sure to arrive at the designated location on time and ready to participate. Enjoy the event and make a positive impact! 🌿",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023),),
                      SizedBox(width:MediaQuery.of(context).size.height*.025 ,),
                      Expanded(child: Text("If you have any specific questions or encounter any issues during the event registration process, don't hesitate to reach out to our support team for assistance. We're here to help! 🤝",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Container(
                    height: MediaQuery.of(context).size.height*.1,
                    width:  MediaQuery.of(context).size.width*.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.02),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      boxShadow: [
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
                          Text("Was this helpful ?",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022),),
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
            Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(152, 238, 134, 1.0), Color.fromRGBO(160,190, 249, 1.0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.01,vertical: MediaQuery.of(context).size.height*.015),
                        child: Column(
                          children: [
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [Colors.green, Colors.blue],
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  'GrowLife',
                                  style: GoogleFonts.lato(
                                    fontSize:MediaQuery.of(context).size.height*.028 ,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.015 ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Cultivating a Greener World. We raise awareness about ",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.018 ),),
                                  SizedBox(height: MediaQuery.of(context).size.height*.01 ),
                                  Text("tree plantation, promote environmental conservation,",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.018 ),),
                                  SizedBox(height: MediaQuery.of(context).size.height*.01 ),
                                  Text("and nurture a love for nature. Together, we can make a ",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.018 ),),
                                  SizedBox(height: MediaQuery.of(context).size.height*.01 ),
                                  Text("significant impact on our planet's well-being.",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.018 ),),
                                  SizedBox(height: MediaQuery.of(context).size.height*.01 ),
                                ],
                              ),
                            ),

                            Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text("Quick Link",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold ),))

                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                    },
                                    child: Text("Home",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),
                                SizedBox(width:MediaQuery.of(context).size.width*.08 ,),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                                    },
                                    child: Text("Privacy Policy",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),
                                SizedBox(width:MediaQuery.of(context).size.width*.1,),
                                Text("English(UK)",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold,color: Colors.black38),),
                                Icon(Icons.arrow_drop_down_sharp,color:Colors.black,size: MediaQuery.of(context).size.height*.025 ,)
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                            Row(

                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopping()));
                                    },
                                    child: Text("Shop",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),
                                SizedBox(width:MediaQuery.of(context).size.width*.095 ,),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TermandCondition()));
                                    },
                                    child: Text("Term & Condition",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),


                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                            Row(

                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Events()));
                                    },
                                    child: Text("Event",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),
                                SizedBox(width:MediaQuery.of(context).size.width*.085 ,),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                                    },
                                    child: Text("Help Center",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),

                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                            Row(

                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                                    },
                                    child: Text("About",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),
                                SizedBox(width:MediaQuery.of(context).size.width*.08 ,),
                                Text("Return Policy",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),),

                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                            Row(

                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                                    },
                                    child: Text("Contact",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.02),)),

                              ],
                            ),


                          ],
                        ),
                      ),

                    ],


                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.04,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: Text("C"),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*.01 ),
                        Text("2023 GrowLife", style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.02,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}