import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/pages/signupscreen.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context){

         return WillPopScope(
           onWillPop: () async{
             SystemNavigator.pop();
             return false;
           },
           child: SafeArea(
             child: Scaffold(
               backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*.08,),
                    Container(
                        child: Image.asset("assets/images/Growlife.png",height:  MediaQuery.of(context).size.height*.15,width:  MediaQuery.of(context).size.width*.35,fit: BoxFit.fill,)),
                    SizedBox(height:  MediaQuery.of(context).size.height*.02,),
                    Image.asset("assets/images/GrowLifeText.png",height:MediaQuery.of(context).size.height*.04,),
                    SizedBox(height:  MediaQuery.of(context).size.height*.06,),
                    Center(
                      child: Container(
                        width:  MediaQuery.of(context).size.width*.810,
                        height:  MediaQuery.of(context).size.height*.270,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:  MediaQuery.of(context).size.height*.013,),
                            Image.asset("assets/images/notification.png",height:  MediaQuery.of(context).size.height*.040,width:  MediaQuery.of(context).size.width*.1,),
                            SizedBox(height:  MediaQuery.of(context).size.height*.013,),
                            Text("Allow “GrowLife” to send",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025 ,fontWeight: FontWeight.bold),),
                            Text("you notifications?",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.height*.07),
                            Container(
                              height: MediaQuery.of(context).size.height*.001,
                              width: MediaQuery.of(context).size.width*.819,
                              color:  Color(0xFF1F588E),
                            ),
                            Row(
                              children: [
                                SizedBox(width:  MediaQuery.of(context).size.height*.07),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                  },
                                    child: Text("ALLOW",style:GoogleFonts.lato(color: Color(0xFF1F588E),fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020) ,)),
                                Padding(
                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.04,right:MediaQuery.of(context).size.height*.04 ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*.072,
                                    width: MediaQuery.of(context).size.width*.002,
                                    color:  Color(0xFF1F588E),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.height*.004 ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                    },
                                      child: Text("DON'T ALLOW",style:GoogleFonts.lato(color: Color(0xFF1F588E),fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020)) ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.25,),
                    Text("by continuing, you’re accepting our",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width*.043,),),
                    SizedBox(height:MediaQuery.of(context).size.height*.005 ,),
                    Text(" privacy policy & terms of service",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width*.043,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

            ),
       ),
         );
  }
}
