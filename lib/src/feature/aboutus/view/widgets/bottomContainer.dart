import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/aboutus/view/aboutus.dart';
import 'package:growlife/src/feature/costumersupport/view/Contact.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/term_condition/view/term&condition.dart';
import 'package:growlife/src/utils/route.dart';
class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      decoration: const BoxDecoration(
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
                          return const LinearGradient(
                            colors: [Colors.green, Colors.blue],
                          ).createShader(bounds);
                        },
                        child: Text(
                          'GrowLife',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16 ,
                            fontWeight: FontWeight.w600,
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
                          Text("Cultivating a Greener World. We raise awareness about\ntree plantation, promote environmental conservation\n and nurture a love for nature. Together, we can make a \nsignificant impact on our planet's well-being. ",style: GoogleFonts.plusJakartaSans(color: Colors.black,fontSize: 14, ),),
                          SizedBox(height: MediaQuery.of(context).size.height*.01 ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("Quick Link",style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500
                        ),))

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
                             router.push(HomeScreen.routePath);
                            },
                            child: Text("Home",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),
                        SizedBox(width:MediaQuery.of(context).size.width*.08 ,),
                        InkWell(
                            onTap: (){
                             router.push(PrivacyPolicy.routePath);
                            },
                            child: Text("Privacy Policy",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),
                        SizedBox(width:MediaQuery.of(context).size.width*.1,),
                        Text("English(UK)",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black38),),
                        Icon(Icons.arrow_drop_down_sharp,color:Colors.black,size: MediaQuery.of(context).size.height*.025 ,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                    Row(

                      children: [
                        InkWell(
                            onTap: (){
                             router.push(Shopping.routePath);
                            },
                            child: Text("Shop",style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),
                        SizedBox(width:MediaQuery.of(context).size.width*.095 ,),
                        InkWell(
                            onTap: (){
                             router.push(TermandCondition.routePath);
                            },
                            child: Text("Term & Condition",style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),


                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                    Row(

                      children: [
                        InkWell(
                            onTap: (){
                             router.push(Events.routePath);
                            },
                            child: Text("Event",style:GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),
                        SizedBox(width:MediaQuery.of(context).size.width*.085 ,),
                        InkWell(
                            onTap: (){
                              router.push(Help.routePath);
                            },
                            child: Text("Help Center",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),

                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                    Row(

                      children: [
                        InkWell(
                            onTap: (){
                             router.push(AboutUs.routePath);
                            },
                            child: Text("About",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),
                        SizedBox(width:MediaQuery.of(context).size.width*.08 ,),
                        Text("Return Policy",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400)),

                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                    Row(

                      children: [
                        InkWell(
                            onTap: (){
                              router.push(ContactUs.routePath);
                            },
                            child: Text("Contact",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w400))),

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
                  child: const Center(
                    child: Text("C"),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.01 ),
                Text("2023 GrowLife", style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w500
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
