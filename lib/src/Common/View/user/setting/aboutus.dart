import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:growlife/src/Common/View/user/setting/Contact.dart';
import 'package:growlife/src/Common/View/user/setting/Setting.dart';
import 'package:growlife/src/Common/View/user/setting/help.dart';
import 'package:growlife/src/Common/View/user/setting/privacypolicy.dart';
import 'package:growlife/src/Common/View/user/setting/term&condition.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/Events/events.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/shopping.dart';
import 'package:growlife/src/feature/homeview/homescreen.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            Text("About Us",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/aboutus.png"),
                    Positioned(
                      left:  220,
                        top:  120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("We bring ",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35 ),),
                            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
                            Text("you closer",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35 ),),
                            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
                            Text("to the earth",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35 ),),
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
                            TextSpan(text: "Welcome to ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black)),
                            TextSpan(
                              text: 'GROWLIFE',
                              style: GoogleFonts.lato(color: Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.022 ),
                            ),
                            TextSpan(text:"! We are passionate about making a positive impact on the environment and fostering a greener future.Our mission is to promote tree plantation, raise awareness about the importance of greenery, and facilitate community engagement in environmental initiatives. Here's a glimpse into who we are and what we stand for.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.022 )),
                          ],
                        ),
                      ),

                    ],

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Text("Our Mission",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Padding(
                      padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
                      child: Stack(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text:"Our mission is to create a\n greener and more sustain-\n able future by promoting\n tree plantation, environ-\n mental conservation, and \ncommunity engagement. We are driven by the belief that every individual has the power to make a positive impact on our planet.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                              ],
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.height*.24,

                              child: Image.asset("assets/images/mission.png",height:MediaQuery.of(context).size.height*.122 ,width: MediaQuery.of(context).size.width*.39,))
                        ],
                      ),
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("Through our initiatives, we aim to:",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027),)),
                      SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: 'Tree Plantation:  ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),
                            TextSpan(text:"We believe in the power of trees to improve air quality, prevent soil erosion, provide habitat for wildlife, and contribute to a healthier planet. Our mission is to encourage widespread tree plantation initiatives, ensuring a greener and more sustainable environment for future generations.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: 'Environmental Conservation: ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),
                            TextSpan(text:"We are commit- ted to conserving and protecting the environ- ment through various initiatives. By raising awareness about environmental issues and promoting sustainable practices, we aim to preserve natural resources, reduce waste, and mitigate the negative impacts of human activities on the planet.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: 'Community Engagement: ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),
                            TextSpan(text:"We recognize that creating meaningful change requires collective action. Our mission involves actively engaging individuals and communities in environmental activities and events. Through educational workshops, volunteering opportunities, and collaborative projects, we foster a sense of responsibility and empower people to become stewards of the environment. ",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: ' Education and Awareness:  ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),
                            TextSpan(text:"We believe that knowledge is key to driving change. Our mission includes providing educational resources, organizing informative sessions, and spreading awareness about the importance of trees, plants, and environmental sustainability. By equipping individuals with knowledge, we empower them to make informed decisions and take steps towards a greener lifestyle.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),


                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: 'Collaboration and Partnerships: ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),
                            TextSpan(text:"We under- stand the significance of collaboration in achieving our mission. We actively seek partnerships with like-minded organizations, NGOs, businesses, and government bodies to amplify our impact and work together towards a common goal. By joining forces, we can make a greater difference in preserving our environment.",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 )),
                            TextSpan(
                              text: 'Together, with our dedicated team, passionate volunteers, and the support of individuals like you, we strive to create a world where nature thrives, the environment is protected, and future generations can enjoy a sustainable planet. ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.02 ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[

                            TextSpan(
                              text: ' Join us in our mission and be part of the positive change we can bring to the world. ',
                              style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.height*.021 ),
                            ),]
                        )),


                    ],

                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
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
