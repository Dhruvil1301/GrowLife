import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/user/setting/Setting.dart';
import 'package:growlife/user/setting/helpquestion.dart';
class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Help Center",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.035,vertical: MediaQuery.of(context).size.height*.02 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Hi,How can we help you?",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold),),
                SizedBox(height: MediaQuery.of(context).size.height*.025,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.blueGrey,),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.lato(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.04),
                    ),
                  ),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.16,
                        width:  MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.025),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/account.png",height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Account & Profile",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.019 ),),

                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.16,
                        width:  MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.025),
                            border: Border.all(
                                color: Colors.black,
                                width: 0.2
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/event_donation.png",height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Events & Donations",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.019 ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.025,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.16,
                        width:  MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.025),
                            border: Border.all(
                                color: Colors.black,
                                width: 0.2
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/shop_purchase.png",height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Shop & Purchases",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.019 ),),

                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.16,
                        width:  MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.025),
                            border: Border.all(
                                color: Colors.black,
                                width: 0.2
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/technical_support.png",height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Technical Support",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.019 ),),

                          ],
                        ),
                      ),
                    ],
                  ),
              ],),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What's New",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.026 ),),
                  SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Question()));
                    },
                      child: Text("How can I join an event through the app?",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ,color: Color(0xFF4393F2)),)),
                  SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                  Text("What payment methods are accepted for Purchases?",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ,color: Color(0xFF4393F2)),),
                  SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                  Text("How do I update to the latest version of the app?",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ,color: Color(0xFF4393F2)),),
                  SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                  Text("Can I cancel my event registration if I am unable to attend?",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ,color: Color(0xFF4393F2)),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



