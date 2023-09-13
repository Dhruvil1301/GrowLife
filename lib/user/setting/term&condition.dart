import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/Events/events.dart';
import 'package:growlife/user/setting/Contact.dart';
import 'package:growlife/user/setting/Setting.dart';
import 'package:growlife/user/setting/aboutus.dart';
import 'package:growlife/user/setting/help.dart';
import 'package:growlife/user/setting/privacypolicy.dart';

import '../../Navigationobjects/shop/shopping.dart';
import '../../screen/homescreen.dart';
class TermandCondition extends StatefulWidget {
  const TermandCondition({Key? key}) : super(key: key);

  @override
  State<TermandCondition> createState() => _TermandConditionState();
}

class _TermandConditionState extends State<TermandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text("Term and Condition",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Welcome to ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black)),
                        TextSpan(
                          text: 'GROWLIFE. ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.025 ),
                        ),
                        TextSpan(text:"This page outlines the terms and conditions and privacy policy that govern your use of our app. By using our app, you agree to comply with these terms and policies. We encourage you to read this information carefully to understand your rights and responsibilities.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),

                ],

              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.blueGrey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
              child: Column(
                children: [
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("Terms and Conditions",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'App Usage:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"Your use of the app is subject to these terms and conditions. You agree not to misuse or modify the app, interfere with its functionality, or attempt unauthorized access to its systems.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Account Responsibility: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"You are responsible for maintaining the confidentiality of your account information. You agree to provide accurate and complete information when creating an account and to update it promptly if any changes occur.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Content Ownership:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"You retain ownership of the content you post or share on the app. By posting or sharing content, you grant us a non-exclusive, worldwide, royalty-free license to use, reproduce, modify, and distribute the content for the purpose of providing our services.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Intellectual Property:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"All intellectual property rights related to the app, including logos, designs, and trademarks, are owned by us or our partners. You agree not to use or reproduce any of these materials without our explicit permission.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Links to Third-Party Websites:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"Our app may contain links to third-party websites or services. We are not responsible for the content or practices of these websites. Your interactions with these third-party services are governed by their respective terms and policies.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),

                ],

              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.blueGrey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
              child: Column(
                children: [
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("Privacy Policy",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Information Collection: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"We collect certain personal information when you use our app. This includes information provided during account creation, event registrations, donations, and purchases. We may also collect usage data to improve our services and tailor content to your preferences.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Usage: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:" We use your personal information to provide and enhance our services, commu-nicate with you, and ensure the security of our app. We do not share your personal information with third parties for marketing purposes without your consent. ",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Security:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:"We implement appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no data transmission over the internet or storage system is 100% secure, and we cannot guarantee absolute security.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Cookies and Tracking Technologies:  ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                        ),
                        TextSpan(text:" We use cookies and similar tracking technologies to enhance your experience, analyze usage patterns, and deliver personalized content. You can manage your cookie preferences through your browser settings.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),


                ],

              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.blueGrey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
              child: Column(
                children: [
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("Changes to Terms and Policy",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text:"We reserve the right to update or modify these terms and policies at any time. Any changes will be effective immediately upon posting on this page. By continuing to use the app after changes are made, you agree to be bound by the updated terms and policies.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                      ],
                    ),
                  ),



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
            ),
          ],
        ),
      ),
    );
  }
}
