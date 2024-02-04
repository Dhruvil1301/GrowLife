import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/home/view/widgets/commentbox.dart';
import 'package:growlife/src/feature/home/view/widgets/videoList.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
class VideoDetailScreen extends StatefulWidget {

  const VideoDetailScreen({Key? key}) : super(key: key);
  static const routePath="/videodetail";
  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  String selectedQuality = 'Auto';
  String selectedSpeed ="Normal";
  bool isFeatureEnabled = false;
  void _updateFeature(bool newValue) {
    setState(() {
      isFeatureEnabled = newValue;
    });
  }
  void _toggleFeature() {
    setState(() {
      isFeatureEnabled = !isFeatureEnabled;
    });

    // Show a Snackbar when the feature is turned on/off
    final snackBar = SnackBar(
      content:
         Text(
          isFeatureEnabled ? 'Captions turned ON' : 'Captions turned OFF',
        style: GoogleFonts.lato(),),

      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/video1.1.png"),
                Positioned(
                    top:  MediaQuery.of(context).size.height*.1,
                    left:MediaQuery.of(context).size.height*.2 ,
                    child: Image.asset("assets/images/Pause.png",height: MediaQuery.of(context).size.height*.08 ,width:  MediaQuery.of(context).size.height*.08,)),
                Positioned(
                  top:  MediaQuery.of(context).size.height*.01,
                  left:MediaQuery.of(context).size.height*.01 ,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                        child: Icon(Icons.arrow_back,color: Colors.white,size: MediaQuery.of(context).size.height*.035,)),
                ),
                Positioned(
                  top:  MediaQuery.of(context).size.height*.01,
                  left:MediaQuery.of(context).size.height*.36 ,
                  child: Icon(Icons.closed_caption_off,color: Colors.white,size: MediaQuery.of(context).size.height*.035,),
                ),
                Positioned(
                  top:  MediaQuery.of(context).size.height*.01,
                  left:MediaQuery.of(context).size.height*.41 ,
                  child: InkWell(
                     onTap: (){

                         showModalBottomSheet(
                           context: context,
                           backgroundColor: Colors.white,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                           builder: (BuildContext context) {
                             return Container(
                               constraints: BoxConstraints(
                                 minHeight: MediaQuery.of(context).size.height*.2, // Minimum height of the bottom sheet
                                 maxHeight: MediaQuery.of(context).size.height*.35, // Maximum height of the bottom sheet
                               ),
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: <Widget>[
                                   Container(
                                     padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.01),
                                     child: Container(
                                       height: MediaQuery.of(context).size.height*.007,
                                       width: MediaQuery.of(context).size.width*.2,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                                           color: Colors.grey.withOpacity(.5),
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.02 ),
                                     child: Column(

                                       children: [
                                         ListTile(
                                           leading: Icon(Icons.settings),
                                           title: Row(
                                             children: [
                                               Text('Quality:',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04 ),),
                                               SizedBox(width:MediaQuery.of(context).size.width*.06 ), // Add spacing
                                               DropdownButton<String>(
                                                 value: selectedQuality,
                                                 items: ['Auto', '240p', '720p', '1080p'].map((String quality) {
                                                   return DropdownMenuItem<String>(
                                                     value: quality,
                                                     child: Text(quality,style: GoogleFonts.lato(),),
                                                   );
                                                 }).toList(),
                                                 onChanged: (String ?newValue) {
                                                   setState(() {
                                                     selectedQuality = newValue!;
                                                   });
                                                   // You can add logic here to update the video quality based on the selected option.
                                                   // Example: _setVideoQuality(newValue);
                                                   Navigator.pop(context);
                                                 },
                                                 underline: Container(),
                                               ),
                                             ],
                                           ),
                                           onTap: () {
                                             // Remove this onTap handler if you want to use the dropdown only
                                           },
                                         ),
                                         ListTile(
                                           leading: Icon(Icons.closed_caption),
                                           title: Row(
                                             children: [
                                               Text('Captions',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04)),
                                               SizedBox(width:MediaQuery.of(context).size.width*.01 ),
                                               Switch(
                                                 value: isFeatureEnabled,
                                                 onChanged: (bool newValue) {
                                                   _toggleFeature();
                                                   Navigator.pop(context);
                                                 },
                                                 activeTrackColor: Colors.lightBlueAccent.withOpacity(.5),
                                                 activeColor: Colors.blue,
                                               ),
                                             ],
                                           ),
                                           onTap: () {
                                             _toggleFeature();
                                             Navigator.pop(context);
                                           },
                                         ),
                                         ListTile(
                                           leading: Icon(Icons.speed),
                                           title: Row(
                                             children: [
                                               Text('Speed',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04 ),),
                                               SizedBox(width:MediaQuery.of(context).size.width*.09 ),
                                               DropdownButton<String>(
                                                 value: selectedSpeed,
                                                 items: ['0.25x', '0.5x', '0.75x', 'Normal',"1.25x","1.5x","1.75","2x"].map((String quality) {
                                                   return DropdownMenuItem<String>(
                                                     value: quality,
                                                     child: Text(quality,style: GoogleFonts.lato(),),
                                                   );
                                                 }).toList(),
                                                 onChanged: (String ?newValue) {
                                                   setState(() {
                                                     selectedSpeed = newValue!;
                                                   });


                                                   // You can add logic here to update the video quality based on the selected option.
                                                   // Example: _setVideoQuality(newValue);
                                                   Navigator.pop(context);
                                                 },
                                                 underline: Container(),
                                               ),
                                             ],
                                           ),
                                           onTap: () {

                                             Navigator.pop(context);
                                           },
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             );
                           },
                         );
                       },
                      child: Icon(Icons.settings,color: Colors.white,size: MediaQuery.of(context).size.height*.035,)),
                ),
                Positioned(
                  top:  MediaQuery.of(context).size.height*.25,
                  left:MediaQuery.of(context).size.height*.01 ,
                  child: Text("0:00 / 1:20:42",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                ),
                Positioned(
                    top:  MediaQuery.of(context).size.height*.24,
                    left:MediaQuery.of(context).size.height*.42 ,
                    child: Icon(Icons.fullscreen,color: Colors.white,size:MediaQuery.of(context).size.height*.035 ,)
                ),
              ],

            ),
            SizedBox(height:  MediaQuery.of(context).size.height*.013,),
            Align(
              alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*.04 ),
                  child: Text("Nurturing Nature - A Growing Plants Event",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:  16),),
                )),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.02 ),
                    child: Image.asset(ImageAssets.circularimg1,height:MediaQuery.of(context).size.height*.06 ,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Isabella",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize: 16),),
                        Row(
                          children: [
                            Text("1.0M Views",style: GoogleFonts.poppins(fontSize:  14,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                  ),
                       SizedBox(width:  MediaQuery.of(context).size.height*.012,),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("FOLLOW",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColor.primary,fontSize:  13),),

                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.height*.022),
                                child: Text("1 hr ago",style: GoogleFonts.poppins(fontSize:  14,fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                        ],
                      )



                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05,vertical:MediaQuery.of(context).size.height*.03  ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.favorite,color: Colors.red,size: 25,),
                      Text("20k",style: GoogleFonts.roboto(fontSize: 12),),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),// Enable scrolling in the bottom sheet
                            builder: (BuildContext context) {
                              return Commentbox();
                            },
                          );
                        },
                          child: Icon(Icons.comment_outlined,color: Colors.black,size: 25)),
                      Text("20k",style: GoogleFonts.roboto(fontSize: 12),),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                        builder: (BuildContext context) {
                          return Container(
                            constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height*.2, // Minimum height of the bottom sheet
                              maxHeight: MediaQuery.of(context).size.height*.35, // Maximum height of the bottom sheet
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.01),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*.01,
                                    width: MediaQuery.of(context).size.width*.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                                      color: Colors.grey
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.03, ),
                                  child: Container(
                                      alignment: AlignmentDirectional.topStart,
                                        child: Image.asset(ShareAssets.copylink,height: MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.height*.18,)),

                                ),
                              Container(
                                height:MediaQuery.of(context).size.height*.0005 ,
                                width: MediaQuery.of(context).size.width*1,
                                color: Colors.black,
                              ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03,horizontal:  MediaQuery.of(context).size.height*.04 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(ShareAssets.whatsapp,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.tiwtter,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.instagram,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.facebook,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal:  MediaQuery.of(context).size.height*.04 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(ShareAssets.drive,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.mail,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.bluetooth,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset(ShareAssets.more,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );

                    },
                      child: Icon(Icons.share,color: Colors.black,size: 25)),
                  
                  Icon(Icons.more_vert_sharp,color: Colors.black,size: 25),

                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.007 ,
              width: MediaQuery.of(context).size.height*.5 ,
              color: Colors.grey.withOpacity(.5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                  child: Text("Recommended videos",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VideoList(ownerName:"Roy" , ownerImg: ImageAssets.circularimg2, views: "20k Views", timeofUploading:"2 days ago" , video: ImageAssets.video2, videoTitle: "Nurturing Nature - A Growing Plants Event", onTap: (){
              }),
            ),
          ],
        ),
      ),
    ),

    );
  }
}

