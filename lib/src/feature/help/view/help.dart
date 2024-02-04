import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';
import 'package:growlife/src/feature/help/view/widgets/helpquestionlist.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/help/view/widgets/helpquestion.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';
class Help extends StatefulWidget {

  const Help({Key? key}) : super(key: key);
  static const routePath="/help";
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CommonAppBar(title: "Help Center"),
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
                Text("Hi,How can we help you?",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w500),),
                SizedBox(height: MediaQuery.of(context).size.height*.025,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,color: Colors.blueGrey,),
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
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.account,height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Account & Profile",style: GoogleFonts.plusJakartaSans(fontSize: 16 ),),

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
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.event_donation,height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Events & Donations",style: GoogleFonts.plusJakartaSans(fontSize: 16 ),),

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
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.shop_purchase,height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Shop & Purchases",style:  GoogleFonts.plusJakartaSans(fontSize: 16 ),),

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
                            boxShadow: const[
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.technical_support,height: MediaQuery.of(context).size.height*.11, width:  MediaQuery.of(context).size.width*.33,),
                            Text("Technical Support",style:  GoogleFonts.plusJakartaSans(fontSize: 16 ),),

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
                  Text("What's New",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 20 ),),
                  SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                    HelpQuestionList(question: "How can I join an event through the app?",onTap: (){
                     router.push(HelpQuestion.routePath);
                   },),
                  const HelpQuestionList(question: "What payment methods are accepted for Purchases?"),
                  const HelpQuestionList(question: "How do I update to the latest version of the app?"),
                  const HelpQuestionList(question: "Can I cancel my event registration if I am unable to attend?"),
                  
                ],
              ),
            ),
            const BottomContainer(),
          ],
        ),
      ),
    );
  }
}



