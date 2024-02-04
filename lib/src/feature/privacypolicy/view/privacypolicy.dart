
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';

import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/aboutus/view/aboutus.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/term_condition/view/term&condition.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
class PrivacyPolicy extends StatefulWidget {

  const PrivacyPolicy({Key? key}) : super(key: key);
  static const routePath="/privacypolicy";
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String _languageValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CommonAppBar(title: "Privacy"),
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
                        TextSpan(text: "At ",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black)),
                        TextSpan(
                          text: 'GROWLIFE, ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text:"we value your privacy and are committed to protecting your personal information. This page outlines how we collect, use, and safeguard your data when you use our app. By using the app, you agree to the practices described in this Privacy Policy.",style:  GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black)),
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
                      child: Text("Information We Collect",style:  GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Personal Information: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"When you sign up for an account, we collect certain personal information, such as your name, email address, and contact details. ",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Profile Information: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"You have the option to provide additional profile information, such as your bio, profile picture, and location",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Activity Data: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We may collect information about your app usage, including events attended,donations made, and purchases  ",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("How We Use Your Information",style:GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'App Experience: ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We use your information to provide you with a seamless app experience, personalize content, and offer relevant recommendations. ",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Communication: ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We may use your contact information to send you app-related notifications, updates, event reminders, or marketing communications. You can control your communication preferences in the app settings.",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Analysis: ',
                          style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We may analyze user data in an aggregated and anonymized form to gain insights, improve our services, and measure the effectiveness of our initiatives.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("Data Security and Protection",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Security Measures: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:" We implement industry- standard security measures to protect your data from unauthorized access, disclosure, or alteration. Our systems are regularly monitored and updated to ensure the highest level of security.",style:GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Third-Party Access: ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We do not sell or share your personal information with third parties for marketing purposes. We only disclose your information to trusted partners or service providers who assist us in delivering our services.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Retention: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"We retain your data for as long as necessary to fulfill the purposes outlined in this Privacy Policy. When data is no longer needed, we securely dispose of or anonymize it.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("Your Choices and Control",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Account Settings: ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"You can review and update your account information, profile details, and communication preferences within the app's settings.",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),



                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Opt-Out:',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"You have the right to opt-out of receiving promotional communications from us. You can do so by adjusting your communication preferences or using the unsubscribe link provided in our emails.",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[

                        TextSpan(
                          text: 'Data Deletion: ',
                          style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"If you wish to delete your account or have your personal data removed from our systems, you can contact our support team to request deletion.",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),


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
                      child: Text("Updates to the Privacy Policy",style: GoogleFonts.plusJakartaSans(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600))),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "We may update this ",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text:"from time to time to reflect changes in our practices or legal requirements. We will notify you of any significant changes through the app or via email.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                      ],
                    ),
                  ),


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
