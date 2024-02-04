import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/home/view/widgets/videoList.dart';
import 'package:growlife/src/feature/notification/view/notification.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:provider/provider.dart';

import 'videodetail.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pagecontroller;
  @override
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));
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
                                     padding:  const EdgeInsets.all(2.0),
                                     child: Container( height:MediaQuery.of(context).size.height*.013,
                                  width: MediaQuery.of(context).size.width*.03,
                                  decoration: const BoxDecoration(
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
                                Text("Hello,",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w500),),
                                Text("User",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w700),),
                              ],
                            ),

                      ),
                      SizedBox(width: MediaQuery.of(context).size.height*.23 ,),
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.035,left: MediaQuery.of(context).size.height*.02 ),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notifications()));
                            },
                            child: Stack(
                              children: [
                                const Icon(Icons.notifications,color: Colors.black,size:30,),
                                Positioned(
                                    left: 20,
                                  top: 2,
                                    child:
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF20C968)
                                      ),
                                    ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:MediaQuery.of(context).size.height*.36,
                        child: PageView.builder(
                          controller: pagecontroller,
                            itemBuilder:(_,index){
                            return AnimatedBuilder(animation: pagecontroller, builder:(context,child){
                              return child!;
                            },
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical:  MediaQuery.of(context).size.height*.012 ),
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.homepage1,height:  MediaQuery.of(context).size.height*.15,width:  MediaQuery.of(context).size.width*1,),
                                    Container(
                                        alignment: AlignmentDirectional.topStart,

                                        child: Text("Green Thumb Gardening Workshop",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 17),)),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    Row(
                                      children: [
                                        Text("Date: ",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16),),
                                        Text("Saturday, August 14th, 2023",style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 16),)
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.0045 ,),
                                    Container(
                                        alignment:AlignmentDirectional.topStart,
                                        child: Text("Join us for a community-wide tree planting event! \nTogether, we aim to grow 500 new trees in City Park. ",style:GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 15),)),
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
                                                  color: const Color(0xFF1F588E),
                                              ),
                                          ),
                                          child: Center(child: Text("View Event",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: const Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                                        Container(
                                          height: MediaQuery.of(context).size.height*.045 ,
                                          width: MediaQuery.of(context).size.width*.23 ,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: const Color(0xFF1F588E)
                                              )
                                          ),
                                          child: Center(child: Text("Donate",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: const Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                        ),
                                      ],
                                    ),
                                  ],
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
                            Text("Feed",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize:  20),),
                            SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                            VideoList(ownerName:"Isabella" , ownerImg: ImageAssets.circularimg1, views: "1.0M Views", timeofUploading:"1 hr ago" , video: ImageAssets.video1, videoTitle: "Nurturing Nature - A Growing Plants Event", onTap: (){
                             router.push(VideoDetailScreen.routePath);
                            }),
                            VideoList(ownerName:"Isabella" , ownerImg: ImageAssets.circularimg1, views: "1.0M Views", timeofUploading:"1 hr ago" , video: ImageAssets.video1, videoTitle: "Nurturing Nature - A Growing Plants Event", onTap: (){
                              router.push(VideoDetailScreen.routePath);
                            }),

                          ],
                        ),
                      )
                    ],
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
          title: const Text("Confirm Exit"),
          content: const Text("Are you sure you want to exit the app?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to cancel the exit
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}

