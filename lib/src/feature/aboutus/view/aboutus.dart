import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';
import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/term_condition/view/term&condition.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/res/assets.dart';
class AboutUs extends StatefulWidget {

  const AboutUs({Key? key}) : super(key: key);
  static const routePath="/aboutus";
  @override
  State<AboutUs> createState() => _AboutUsState();
}
class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CommonAppBar(title: "About Us"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(ImageAssets.aboutUs),
                    Positioned(
                       right: 10,
                        bottom: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("We bring\nyou closer\nto the earth ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 26 ),),

                          ],
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: "Welcome to ",style: GoogleFonts.plusJakartaSans(fontSize: 15,color: Colors.black)),
                            TextSpan(
                              text: 'GROWLIFE',
                              style: GoogleFonts.poppins(color: const Color(0xFF327E47),fontSize:15),
                            ),
                            TextSpan(text:"! We are passionate about making a positive impact on the environment and fostering a greener future.Our mission is to promote tree plantation, raise awareness about the importance of greenery, and facilitate community engagement in environmental initiatives. Here's a glimpse into who we are and what we stand for.",style: GoogleFonts.plusJakartaSans(fontSize: 15,color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Text("Our Mission",style: GoogleFonts.plusJakartaSans(fontSize: 22,fontWeight: FontWeight.w600)),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Padding(
                      padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
                      child: Stack(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text:"Our mission is to create a\n greener and more sustain-\n able future by promoting\n tree plantation, environ-\n mental conservation, and \ncommunity engagement. We are driven by the belief that every individual has the power to make a positive impact on our planet.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black)),
                              ],
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.height*.24,

                              child: Image.asset(ImageAssets.mission,height:MediaQuery.of(context).size.height*.122 ,width: MediaQuery.of(context).size.width*.39,))
                        ],
                      ),
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("Through our initiatives, we aim to:",style: GoogleFonts.plusJakartaSans(fontSize: 16,fontWeight: FontWeight.w600))),
                      SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Tree Plantation:  ',
                              style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            TextSpan(text:"We believe in the power of trees to improve air quality, prevent soil erosion, provide habitat for wildlife, and contribute to a healthier planet. Our mission is to encourage widespread tree plantation initiatives, ensuring a greener and more sustainable environment for future generations.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Environmental Conservation: ',
                              style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            TextSpan(text:"We are commit- ted to conserving and protecting the environ- ment through various initiatives. By raising awareness about environmental issues and promoting sustainable practices, we aim to preserve natural resources, reduce waste, and mitigate the negative impacts of human activities on the planet.",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Community Engagement: ',
                              style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            TextSpan(text:"We recognize that creating meaningful change requires collective action. Our mission involves actively engaging individuals and communities in environmental activities and events. Through educational workshops, volunteering opportunities, and collaborative projects, we foster a sense of responsibility and empower people to become stewards of the environment. ",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Education and Awareness:  ',
                              style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            TextSpan(text:"We believe that knowledge is key to driving change. Our mission includes providing educational resources, organizing informative sessions, and spreading awareness about the importance of trees, plants, and environmental sustainability. By equipping individuals with knowledge, we empower them to make informed decisions and take steps towards a greener lifestyle.",style:  GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Collaboration and Partnerships: ',
                              style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            TextSpan(text:"We under- stand the significance of collaboration in achieving our mission. We actively seek partnerships with like-minded organizations, NGOs, businesses, and government bodies to amplify our impact and work together towards a common goal. By joining forces, we can make a greater difference in preserving our environment.",style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Together, with our dedicated team, passionate volunteers, and the support of individuals like you, we strive to create a world where nature thrives, the environment is protected, and future generations can enjoy a sustainable planet. ',
                              style:  GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            ]
                        )),
                      SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                      Text(
                         ' Join us in our mission and be part of the positive change we can bring to the world. ',
                        style:  GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            const BottomContainer(),
          ],
        ),
      ),
    );
  }
}
