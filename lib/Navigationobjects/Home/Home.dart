
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/main.dart';
import 'package:growlife/pages/notification.dart';
import 'package:growlife/pages/notificationscreen.dart';
import 'package:growlife/user/profile.dart';
import 'package:provider/provider.dart';

import 'Next.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pagecontroller;
  void initState(){
    pagecontroller=PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final exit = await showExitConfirmationDialog(context);
        return exit ?? false;
      },
      child: SafeArea(child:
          Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.03,left:  MediaQuery.of(context).size.height*.02,
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.165,
                                height: MediaQuery.of(context).size.height*.075,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.034),
                                  image: Provider.of<CustomImageProvider>(context).image != null
                                      ? DecorationImage(
                                    image: FileImage(Provider.of<CustomImageProvider>(context).image!),
                                    fit: BoxFit.cover,
                                  )
                                      :null ,
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width*.12,
                                top: MediaQuery.of(context).size.height*.058,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                   child: Padding(
                                     padding:  EdgeInsets.all(2.0),
                                     child: Container( height:MediaQuery.of(context).size.height*.013,
                                  width: MediaQuery.of(context).size.width*.03,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF20C968),
                                      shape: BoxShape.circle
                                  ),),
                                   )
                                  ),

                              ),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(width:MediaQuery.of(context).size.height*.011,),
                      Padding(
                        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.04 ),
                        child:
                            Column(
                              children: [
                                Text("Hello,",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022),),
                                Text("User",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
                              ],
                            ),



                      ),
                      SizedBox(width: MediaQuery.of(context).size.height*.23 ,),
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.03,left: MediaQuery.of(context).size.height*.02 ),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                            },
                            child: Stack(
                              children: [
                                Icon(Icons.notifications,color: Colors.black,size:MediaQuery.of(context).size.height*.04 ,),
                                Positioned(
                                    child:
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF20C968)
                                      ),
                                    ),
                                  left: 20,
                                  top: 2,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         height:MediaQuery.of(context).size.height*.35,
                         child: PageView.builder(
                           controller: pagecontroller,
                             itemBuilder:(_,index){
                             return AnimatedBuilder(animation: pagecontroller, builder:(context,child){
                               return child!;
                             },
                               child: Container(
                                 child: Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical:  MediaQuery.of(context).size.height*.012 ),
                                   child: Column(
                                     children: [
                                       Image.asset("assets/images/Homepage1.png",height:  MediaQuery.of(context).size.height*.15,width:  MediaQuery.of(context).size.width*1,),
                                       Container(
                                           alignment: AlignmentDirectional.topStart,

                                           child: Text("Green Thumb Gardening Workshop",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022,),)),
                                       SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                       Row(
                                         children: [
                                           Text("Date: ",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.02,),),
                                           Text("Saturday, August 14th, 2023",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.02,),)
                                         ],
                                       ),
                                       SizedBox(height: MediaQuery.of(context).size.height*.0045 ,),
                                       Container(
                                           alignment:AlignmentDirectional.topStart,
                                           child: Text("Join us for a community-wide tree planting event!",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),)),
                                       SizedBox(height: MediaQuery.of(context).size.height*.0045 ,),
                                       Container(
                                           alignment:AlignmentDirectional.topStart,
                                           child: Text("Together, we aim to grow 500 new trees in City Park.",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),)),
                                       SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
                                       Row(
                                         children: [
                                           Container(
                                             height: MediaQuery.of(context).size.height*.045 ,
                                             width: MediaQuery.of(context).size.width*.28 ,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(10),
                                                 color: Colors.white,
                                                 border: Border.all(
                                                     color: Color(0xFF1F588E),
                                                 ),
                                             ),
                                             child: Center(child: Text("View Event",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                           ),
                                           SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                                           Container(
                                             height: MediaQuery.of(context).size.height*.045 ,
                                             width: MediaQuery.of(context).size.width*.23 ,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(10),
                                                 color: Colors.white,
                                                 border: Border.all(
                                                     color: Color(0xFF1F588E)
                                                 )
                                             ),
                                             child: Center(child: Text("Donate",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             );
                             }),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.height*.02,),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                             Text("Feed",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.035,),),
                             SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                             Row(
                               children: [
                                 Image.asset("assets/images/circularimg1.png",height:MediaQuery.of(context).size.height*.06 ,),
                                 Padding(
                                   padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Isabella",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022,),),
                                       Row(
                                         children: [
                                           Text("1.0M Views",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),
                                           SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                                           Text("1 hr ago",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),

                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(width:MediaQuery.of(context).size.height*.11 ,),
                                 Padding(
                                   padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.022),
                                   child: Icon(Icons.more_vert_sharp,color: Colors.black45,size:MediaQuery.of(context).size.height*.035 ,),
                                 )

                               ],
                             ),
                             InkWell(
                               onTap:(){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Next()));
                               },
                               child: Stack(
                                 alignment: Alignment.topCenter,
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.022,top: MediaQuery.of(context).size.height*.02 ),
                                     child: Image.asset("assets/images/video1.png"),
                                   ),
                                   Positioned(
                                     top:  MediaQuery.of(context).size.height*.13,
                                       child: Image.asset("assets/images/Pause.png",height: MediaQuery.of(context).size.height*.08 ,width:  MediaQuery.of(context).size.height*.08,))
                                 ],
                               ),
                             ),
                             SizedBox(height: MediaQuery.of(context).size.height*.007 ,),
                             Container(
                                 alignment: AlignmentDirectional.topStart,
                                 child: Text("Nurturing Nature - A Growing Plants Event",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),)),
                             SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                             Row(
                               children: [
                                 Image.asset("assets/images/circularimg1.png",height:MediaQuery.of(context).size.height*.06 ,),
                                 Padding(
                                   padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Isabella",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022,),),
                                       Row(
                                         children: [
                                           Text("1.0M Views",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),
                                           SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                                           Text("1 hr ago",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),

                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(width:MediaQuery.of(context).size.height*.11 ,),
                                 Padding(
                                   padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.022),
                                   child: Icon(Icons.more_vert_sharp,color: Colors.black45,size:MediaQuery.of(context).size.height*.035 ,),
                                 )

                               ],
                             ),
                             InkWell(
                               onTap:(){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Next()));
                               },
                               child: Stack(
                                 alignment: Alignment.topCenter,
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.022,top: MediaQuery.of(context).size.height*.02 ),
                                     child: Image.asset("assets/images/video1.png"),
                                   ),
                                   Positioned(
                                       top:  MediaQuery.of(context).size.height*.13,
                                       child: Image.asset("assets/images/Pause.png",height: MediaQuery.of(context).size.height*.08 ,width:  MediaQuery.of(context).size.height*.08,))
                                 ],
                               ),
                             ),
                             SizedBox(height: MediaQuery.of(context).size.height*.007 ,),
                             Container(
                                 alignment: AlignmentDirectional.topStart,
                                 child: Text("Nurturing Nature - A Growing Plants Event",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),))

                           ],
                         ),
                       )
                     ],
                   ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  Future showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit"),
          content: Text("Are you sure you want to exit the app?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to cancel the exit
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}

