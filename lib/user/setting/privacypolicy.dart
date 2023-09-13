

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/shopping.dart';
import 'package:growlife/screen/homescreen.dart';
import 'package:growlife/user/setting/Contact.dart';
import 'package:growlife/user/setting/Setting.dart';
import 'package:growlife/user/setting/aboutus.dart';
import 'package:growlife/user/setting/help.dart';
import 'package:growlife/user/setting/term&condition.dart';
import 'package:growlife/Navigationobjects/Events/events.dart';
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String _languageValue="";
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
            Text("Privacy Policy",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


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
                        TextSpan(text: "At ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black)),
                        TextSpan(
                          text: 'GROWLIFE, ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.026 ),
                        ),
                        TextSpan(text:"we value your privacy and are committed to protecting your personal information. This page outlines how we collect, use, and safeguard your data when you use our app. By using the app, you agree to the practices described in this Privacy Policy.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
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
                      child: Text("Information We Collect",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Personal Information: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"When you sign up for an account, we collect certain personal information, such as your name, email address, and contact details. ",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Profile Information: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"You have the option to provide additional profile information, such as your bio, profile picture, and location",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Activity Data: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We may collect information about your app usage, including events attended,donations made, and purchases  ",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),


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
                      child: Text("How We Use Your Information",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'App Experience: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We use your information to provide you with a seamless app experience, personalize content, and offer relevant recommendations. ",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Communication: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We may use your contact information to send you app-related notifications, updates, event reminders, or marketing communications. You can control your communication preferences in the app settings.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Analysis: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We may analyze user data in an aggregated and anonymized form to gain insights, improve our services, and measure the effectiveness of our initiatives.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),


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
                      child: Text("Data Security and Protection",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Security Measures: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:" We implement industry- standard security measures to protect your data from unauthorized access, disclosure, or alteration. Our systems are regularly monitored and updated to ensure the highest level of security.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Third-Party Access: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We do not sell or share your personal information with third parties for marketing purposes. We only disclose your information to trusted partners or service providers who assist us in delivering our services.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Retention: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"We retain your data for as long as necessary to fulfill the purposes outlined in this Privacy Policy. When data is no longer needed, we securely dispose of or anonymize it.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),


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
                      child: Text("Your Choices and Control",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Account Settings: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"You can review and update your account information, profile details, and communication preferences within the app's settings.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),



                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Opt-Out:',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"You have the right to opt-out of receiving promotional communications from us. You can do so by adjusting your communication preferences or using the unsubscribe link provided in our emails.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Deletion: ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"If you wish to delete your account or have your personal data removed from our systems, you can contact our support team to request deletion.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),


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
                      child: Text("Updates to the Privacy Policy",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "We may update this ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black)),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 ),
                        ),
                        TextSpan(text:"from time to time to reflect changes in our practices or legal requirements. We will notify you of any significant changes through the app or via email.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
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
            )
          ],
        ),
      ),
    );
  }
}
