

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/main.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ListView(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02 ),
                    child: GestureDetector(
                      onTap: (){
                        _scaffoldKey.currentState!.closeEndDrawer();
                      },
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          height: MediaQuery.of(context).size.height*.045,
                          width: MediaQuery.of(context).size.width*.17,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: .3,
                            ),
                          ),
                          child: Center(child: Image.asset("assets/dashboard/drawerleft.png",height:MediaQuery.of(context).size.height*.03 ,)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.03,),
                  Column(
                    children: [
                     GestureDetector(
                        onTap: (){

                        },
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            height:MediaQuery.of(context).size.height*.06,
                            width:MediaQuery.of(context).size.width*1 ,
                             color: Color(0xFF6683ED) ,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                              child: Row(
                                children: [
                                 Image.asset("assets/dashboard/menuwhite.png",height: MediaQuery.of(context).size.height*.03,),
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  Text("Dashboard",style: GoogleFonts.lato(fontSize: 22,color: Colors.white ,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ) ,
                          ),
                        ),
                      ),
                     SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                     GestureDetector(
                        onTap: (){

                        },
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            height:MediaQuery.of(context).size.height*.06,
                            width:MediaQuery.of(context).size.width*1 ,
                            color:  Colors.white,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                              child: Row(
                                children: [
                                  Image.asset("assets/dashboard/member.png",height: MediaQuery.of(context).size.height*.03),
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  Text("Users",style: GoogleFonts.lato(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ) ,
                          ),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                     GestureDetector(
                       onTap: (){

                       },
                       child: Align(
                         alignment: AlignmentDirectional.topStart,
                         child: Container(
                           height:MediaQuery.of(context).size.height*.06,
                           width:MediaQuery.of(context).size.width*1 ,
                           color: Colors.white,
                           child: Padding(
                             padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                             child: Row(
                               children: [
                                 Image.asset("assets/dashboard/Event.png",height: MediaQuery.of(context).size.height*.03),
                                 SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                 Text("Events",style: GoogleFonts.lato(fontSize: 22,color:Colors.black,fontWeight: FontWeight.bold),)
                               ],
                             ),
                           ) ,
                         ),
                       ),
                     ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                     GestureDetector(
                       onTap: (){

                       },
                       child: Align(
                         alignment: AlignmentDirectional.topStart,
                         child: Container(
                           height:MediaQuery.of(context).size.height*.06,
                           width:MediaQuery.of(context).size.width*1 ,
                           color: Colors.white,
                           child: Padding(
                             padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                             child: Row(
                               children: [
                                 Image.asset("assets/dashboard/product.png",height: MediaQuery.of(context).size.height*.03),
                                 SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                 Text("Products",style: GoogleFonts.lato(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                               ],
                             ),
                           ) ,
                         ),
                       ),
                     ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                     GestureDetector(
                        onTap: (){

                        },
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            height:MediaQuery.of(context).size.height*.06,
                            width:MediaQuery.of(context).size.width*1 ,
                            color:  Colors.white,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                              child: Row(
                                children: [
                                  Image.asset("assets/dashboard/analytics.png",height: MediaQuery.of(context).size.height*.03),
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  Text("Analytics",style: GoogleFonts.lato(fontSize: 22,color:Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ) ,
                          ),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                     GestureDetector(
                       onTap: (){

                       },
                       child: Align(
                         alignment: AlignmentDirectional.topStart,
                         child: Container(
                           height:MediaQuery.of(context).size.height*.06,
                           width:MediaQuery.of(context).size.width*1 ,
                           color:  Colors.white,
                           child: Padding(
                             padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                             child: Row(
                               children: [
                                 Image.asset("assets/dashboard/member.png",height: MediaQuery.of(context).size.height*.03),
                                 SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                 Text("Members",style: GoogleFonts.lato(fontSize: 22,color:Colors.black,fontWeight: FontWeight.bold),)
                               ],
                             ),
                           ) ,
                         ),
                       ),
                     ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          height: isExpanded ? MediaQuery.of(context).size.height*.5 : 100, // Adjust the height as needed
                          child: Column(
                            children: [
                              SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                             isExpanded? GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/dashboard/feedback.png",height: MediaQuery.of(context).size.height*.03),
                                          SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                          Text("Feedback",style: GoogleFonts.lato(fontSize: 22,color:Colors.black,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                               height: 0,
                               color: Colors.white,
                             ),
                              SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                              isExpanded?GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/dashboard/setting.png",height: MediaQuery.of(context).size.height*.03),
                                          SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                          Text("Setting",style: GoogleFonts.lato(fontSize: 22,color:Colors.black,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
                              isExpanded? GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Text("Terms",style: GoogleFonts.lato(fontSize: 22,color:Colors.black26,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              isExpanded? GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF6683ED)
                                            ),
                                          ),
                                          SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                                          Text("Marketing",style: GoogleFonts.lato(fontSize: 18,color:Colors.black),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              isExpanded? GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:  Color(0xFF68ED66)
                                            ),
                                          ),
                                          SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                                          Text("Development",style: GoogleFonts.lato(fontSize: 18,color:Colors.black),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              isExpanded?  GestureDetector(
                                onTap: (){

                                },
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:MediaQuery.of(context).size.height*.06,
                                    width:MediaQuery.of(context).size.width*1 ,
                                    color:  Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:   Color(0xFFEDC766),
                                            ),
                                          ),
                                          SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                                          Text("Activities & Tasks",style: GoogleFonts.lato(fontSize: 18,color:Colors.black),)
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ):Container(
                                height: 0,
                                color: Colors.white,
                              ),

                            ],
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02 ),
                      InkWell(
                        onTap: toggleExpand,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.045 ),
                          child: isExpanded?

                          Row(
                            children: [
                              Icon(Icons.arrow_drop_up,color:Color(0xFF1F588E) ,size: 25,),

                              SizedBox(width: MediaQuery.of(context).size.width*.04,),
                              Text(
                               "See Less",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color:Color(0xFF1F588E),

                                ),
                              ),

                            ],
                          ):
                          Row(
                            children: [
                              Image.asset("assets/dashboard/arrowdown.png",height:MediaQuery.of(context).size.height*.015 ,),

                              SizedBox(width: MediaQuery.of(context).size.width*.04,),
                              Text(
                                "See More",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color:Color(0xFF1F588E),

                                ),
                              ),

                            ],
                          )
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.04),
                        child: Container(
                          height: MediaQuery.of(context).size.height*.0005 ,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.2,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            height:MediaQuery.of(context).size.height*.06,
                            width:MediaQuery.of(context).size.width*1 ,
                            color:  Colors.white,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.043),
                              child: Row(
                                children: [
                                  Image.asset("assets/dashboard/logouticon.png",height: MediaQuery.of(context).size.height*.03),
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  Text("LOGOUT",style: GoogleFonts.lato(fontSize: 23,color: Color(0xFFF66D6D),fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ) ,
                          ),
                        ),
                      )
                    ],
                  ),

                ],
            ),
          ),
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.02 ),
              child: Column(
                children: [
                  Row(
                   children: [
                     Container(
                       height: MediaQuery.of(context).size.height*.06,
                       width: MediaQuery.of(context).size.width*.2,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.white,
                         border: Border.all(
                           color: Colors.blueGrey,
                           width: .3,
                         ),
                       ),
                       child: Center(child: Image.asset("assets/images/Growlife.png",height:MediaQuery.of(context).size.height*.05 ,)),
                     ),
                     Text("GrowLife",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
                     SizedBox(width:MediaQuery.of(context).size.width*.37 ,),
                     GestureDetector(
                       onTap: (){
                        _scaffoldKey.currentState!.openEndDrawer();
                       },
                       child: Container(
                         height: MediaQuery.of(context).size.height*.045,
                         width: MediaQuery.of(context).size.width*.17,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.white,
                           border: Border.all(
                             color: Colors.blueGrey,
                             width: .3,
                           ),
                         ),
                         child: Center(child: Image.asset("assets/dashboard/drawerright.png",height:MediaQuery.of(context).size.height*.03 ,)),
                       ),
                     ),

                   ],
                 ),
                  SizedBox(height :MediaQuery.of(context).size.height*.02,),
                  Padding(
                          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                          child: TextFormField(
                            decoration: InputDecoration(

                              hintText: "Search",
                              hintStyle: GoogleFonts.lato(),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              contentPadding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 )
                          ),
                          ),
                        ),
                  SizedBox(height :MediaQuery.of(context).size.height*.02,),
                  Image.asset("assets/dashboard/welcome.png"),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02 ),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                        child: Text("Dashboard",style: GoogleFonts.lato(fontSize: 27,fontWeight: FontWeight.bold),)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ]
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircularPercentIndicator(radius: 33,
                                              backgroundColor: Colors.white,
                                              progressColor:  Color(0xFFF76D6D),
                                              lineWidth: 9,
                                              percent: .7,
                                              circularStrokeCap: CircularStrokeCap.round,
                                            ),
                                            Text(
                                              '70%', // Your text here
                                              style: GoogleFonts.lato(
                                                fontSize: 20.0, // Adjust the font size as needed

                                                color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Image.asset("assets/dashboard/sales.png",height:MediaQuery.of(context).size.height*.03,)
                                    ],
                                  ),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("Sales",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("\$25,970",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23),),
                                SizedBox(height: MediaQuery.of(context).size.height*.019,),
                                Align(
                                  alignment: Alignment.bottomRight,
                                    child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),))



                              ],
                            ),
                          ),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ]
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircularPercentIndicator(radius: 33,
                                            backgroundColor: Colors.white,
                                            progressColor: Color(0xFFEDC766) ,
                                            lineWidth: 9,
                                            percent: .8,
                                            circularStrokeCap: CircularStrokeCap.round,
                                          ),
                                          Text(
                                            '80%', // Your text here
                                            style: GoogleFonts.lato(
                                                fontSize: 20.0, // Adjust the font size as needed

                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Image.asset("assets/dashboard/revenue.png",height:MediaQuery.of(context).size.height*.03,)
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("Revenue",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("\$14,270",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23),),
                                SizedBox(height: MediaQuery.of(context).size.height*.019,),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),))



                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ]
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircularPercentIndicator(radius: 33,
                                            backgroundColor: Colors.white,
                                            progressColor: Color(0xFF68ED66),
                                            lineWidth: 9,
                                            percent: .6,
                                            circularStrokeCap: CircularStrokeCap.round,
                                          ),
                                          Text(
                                            '60%', // Your text here
                                            style: GoogleFonts.lato(
                                                fontSize: 20.0, // Adjust the font size as needed

                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Image.asset("assets/dashboard/expences.png",height:MediaQuery.of(context).size.height*.03,)
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("Expences",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("\$4,270",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23),),
                                SizedBox(height: MediaQuery.of(context).size.height*.019,),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),))



                              ],
                            ),
                          ),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ]
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircularPercentIndicator(radius: 33,
                                            backgroundColor: Colors.white,
                                            progressColor:Color(0xFF18A0FB) ,
                                            lineWidth: 9,
                                            percent: .8,
                                            circularStrokeCap: CircularStrokeCap.round,
                                          ),
                                          Text(
                                            '80%', // Your text here
                                            style: GoogleFonts.lato(
                                                fontSize: 20.0, // Adjust the font size as needed

                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Image.asset("assets/dashboard/usersicon.png",height:MediaQuery.of(context).size.height*.03,)
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("User",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text("240",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23),),
                                SizedBox(height: MediaQuery.of(context).size.height*.019,),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("Last 4 hours",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),))



                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02 ),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("Recently Payment",style: GoogleFonts.lato(fontSize: 27,fontWeight: FontWeight.bold),)),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for(int i=0;i<3;i++)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.01),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Container(
                              height: MediaQuery.of(context).size.height*.11,
                              width: MediaQuery.of(context).size.width*.7,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1
                                ),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.01 ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/dashboard/avadevis.png",height:MediaQuery.of(context).size.height*.06 ,),
                                        SizedBox(width: MediaQuery.of(context).size.width*.02,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Ava Davis",style: GoogleFonts.lato(fontSize: 22),),
                                            SizedBox(height: MediaQuery.of(context).size.height*.005,),
                                            Text("22-08-2023",style: GoogleFonts.lato(fontSize: 16,color: Colors.black26),),
                                          ],
                                        ),
                                       i==2? SizedBox(width: MediaQuery.of(context).size.width*.08,):SizedBox(width: MediaQuery.of(context).size.width*.1,),
                                        i==2?Container(
                                          height:MediaQuery.of(context).size.height*.035,
                                          width: MediaQuery.of(context).size.width*.19,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEDC766).withOpacity(.3),
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text("PENDING",style: GoogleFonts.lato(color:Color(0xFFEDC766),fontSize: 15 ),)),
                                        ):Container(
                                          height:MediaQuery.of(context).size.height*.035,
                                          width: MediaQuery.of(context).size.width*.17,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF29B927).withOpacity(.3),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text("DONE",style: GoogleFonts.lato(color:Color(0xFF29B927),fontSize: 15 ),)),
                                        )


                                      ],
                                    ),

                                    Align(
                                      alignment: Alignment.bottomRight,
                                        child: Text("\$25,970",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color:i==2?Color(0xFFEDC766) :Color(0xFF29B927) ),))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.02,horizontal: MediaQuery.of(context).size.height*.02 ),
                    child: Image.asset("assets/dashboard/Graph.png"),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02 ),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("Update",style: GoogleFonts.lato(fontSize: 27,fontWeight: FontWeight.bold),)),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      width: MediaQuery.of(context).size.width*1,
                      height: MediaQuery.of(context).size.height*.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),

                        ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for(int i=0;i<4;i++)
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/dashboard/james.png",height: MediaQuery.of(context).size.height*.07,),
                                      SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'James',
                                                style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21,
                                                  color: Colors.black, // You can set your desired color
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' has ordered Rubber Plant & Peace Lily',
                                                style: GoogleFonts.lato(
                                                  fontSize: 21,
                                                  color: Colors.black, // You can set your desired color
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.2 ),
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                        child: Text("25 seconds ago",style: GoogleFonts.lato(color: Colors.black38,fontSize: 18),)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )






                ],
              ),
            ),
          ),

        ),
    );
  }

}
class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Consumer<DashboardNavigationProvider>(
        builder: (context, navigationProvider, child) {
          switch (navigationProvider.selectedIndex) {
            case 0:
              return Menu();
            case 1:
              return Center(child: Text("MSg"),);
            case 2:
              return Center(child: Text("MSg"),);
            default:
              return Center(child: Text("MSg"),);
          }
        },
      ),
      bottomNavigationBar: Consumer<DashboardNavigationProvider>(
        builder: (context, navigationProvider, child) {
          return BottomAppBar(
            color: Colors.white, // Set background color to white
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  "assets/dashboard/menu.png",
                  "assets/dashboard/menugrey.png",
                  0,
                  navigationProvider,
                ),
                _buildNavItem(
                  "assets/dashboard/msg.png",
                  "assets/dashboard/msggrey.png",

                  1,
                  navigationProvider,
                ),
                _buildNavItem(
                  "assets/dashboard/notification.png",
                  "assets/dashboard/notificationgrey.png",
                  2,
                  navigationProvider,
                ),
                _buildNavItem(
                  "assets/dashboard/account.png",
                  "assets/dashboard/accountgrey.png",

                  3,
                  navigationProvider,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
      String activeImage,
      String inactiveImage,
      int index,
      DashboardNavigationProvider provider,
      ) {
    bool isSelected = provider.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        provider.setIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 25,
            child: Image.asset(isSelected ? activeImage : inactiveImage, height: 30),
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }
}


class SalesData {
  final double timeInHours;
  final double sales;

  SalesData(this.timeInHours, this.sales);
}

class MultiLineGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(
              show: false,
              border: Border.all(
                color: Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 21,
            maxX: 27, // Adjust the maximum x-axis value as needed
            minY: 0,
            maxY: 12, // Adjust the maximum y-axis value as needed
            lineBarsData: [
              // Data for this month
              LineChartBarData(
                spots: [
                  FlSpot(21, 0),
                  FlSpot(22, 1),
                  FlSpot(21, 2),
                  FlSpot(23, 4),
                  FlSpot(24, 8),
                  FlSpot(22, 6),
                  FlSpot(26, 2),
                ],
                isCurved: true,
                color: Colors.blue, // Line color for this month
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),

              // Data for last month
              LineChartBarData(
                spots: [
                  FlSpot(22, 1),
                  FlSpot(21, 2),
                  FlSpot(24, 3),
                  FlSpot(23, 3),
                  FlSpot(24, 2),
                  FlSpot(25, 2),
                  FlSpot(26, 1),
                ],
                isCurved: true,
                color: Colors.red, // Line color for last month
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
