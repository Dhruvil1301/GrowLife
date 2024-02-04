import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';
import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/aboutus/view/aboutus.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
class TermandCondition extends StatefulWidget {

  const TermandCondition({Key? key}) : super(key: key);
  static const routePath="/term&condition";
  @override
  State<TermandCondition> createState() => _TermandConditionState();
}

class _TermandConditionState extends State<TermandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CommonAppBar(title: "Term & Condition"),
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
                        TextSpan(text: "Welcome to ",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black)),
                        TextSpan(
                          text: 'GROWLIFE. ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text:"This page outlines the terms and conditions and privacy policy that govern your use of our app. By using our app, you agree to comply with these terms and policies. We encourage you to read this information carefully to understand your rights and responsibilities.",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black)),
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
                      child: Text("Terms and Conditions",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'App Usage:  ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"Your use of the app is subject to these terms and conditions. You agree not to misuse or modify the app, interfere with its functionality, or attempt unauthorized access to its systems.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Account Responsibility: ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"You are responsible for maintaining the confidentiality of your account information. You agree to provide accurate and complete information when creating an account and to update it promptly if any changes occur.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Content Ownership:  ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"You retain ownership of the content you post or share on the app. By posting or sharing content, you grant us a non-exclusive, worldwide, royalty-free license to use, reproduce, modify, and distribute the content for the purpose of providing our services.",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Intellectual Property:  ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"All intellectual property rights related to the app, including logos, designs, and trademarks, are owned by us or our partners. You agree not to use or reproduce any of these materials without our explicit permission.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Links to Third-Party Websites:  ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"Our app may contain links to third-party websites or services. We are not responsible for the content or practices of these websites. Your interactions with these third-party services are governed by their respective terms and policies.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("Privacy Policy",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Information Collection: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We collect certain personal information when you use our app. This includes information provided during account creation, event registrations, donations, and purchases. We may also collect usage data to improve our services and tailor content to your preferences.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Usage: ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:" We use your personal information to provide and enhance our services, commu-nicate with you, and ensure the security of our app. We do not share your personal information with third parties for marketing purposes without your consent. ",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Security:  ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We implement appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no data transmission over the internet or storage system is 100% secure, and we cannot guarantee absolute security.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Cookies and Tracking Technologies:  ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:" We use cookies and similar tracking technologies to enhance your experience, analyze usage patterns, and deliver personalized content. You can manage your cookie preferences through your browser settings.",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("Changes to Terms and Policy",style:  GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text:"We reserve the right to update or modify these terms and policies at any time. Any changes will be effective immediately upon posting on this page. By continuing to use the app after changes are made, you agree to be bound by the updated terms and policies.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
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
