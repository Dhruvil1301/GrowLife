import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/homescreen.dart';
class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
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
                  child: Text("0:00 / 1:20:42",style: GoogleFonts.lato(color: Colors.white),)
                ),
                Positioned(
                    top:  MediaQuery.of(context).size.height*.24,
                    left:MediaQuery.of(context).size.height*.42 ,
                    child: Icon(Icons.fullscreen,color: Colors.white,size:MediaQuery.of(context).size.height*.035 ,)
                ),
              ],

            ),
            SizedBox(height:  MediaQuery.of(context).size.height*.013,),
            Text("Nurturing Nature - A Growing Plants Event",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022,),),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.02 ),
                    child: Image.asset("assets/images/circularimg1.png",height:MediaQuery.of(context).size.height*.06 ,),
                  ),
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
                          Text("FOLLOW",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.018),),

                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.height*.022),
                                child: Text("1 hr ago",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.019,),),
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
                      Icon(Icons.favorite,color: Colors.red,size: 27,),
                      Text("20k"),
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
                              return CommentBottomSheet();
                            },
                          );
                        },
                          child: Icon(Icons.comment_outlined,color: Colors.black,size: 27)),
                      Text("20k"),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet<void>(
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
                                        child: Image.asset("assets/share/copylink.png",height: MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.height*.18,)),

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
                                      Image.asset("assets/share/whatsapp.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/tiwtter.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/instagram.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/facebook.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal:  MediaQuery.of(context).size.height*.04 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/share/drive.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/mail.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/bluetooth.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                      Image.asset("assets/share/more.png",height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );

                    },
                      child: Icon(Icons.share,color: Colors.black,size: 27)),
                  
                  Icon(Icons.more_vert_sharp,color: Colors.black,size: 27),

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
                  child: Text("Recommended videos",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.03,),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset("assets/images/circularimg2.png",height:MediaQuery.of(context).size.height*.06 ,),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Roy",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.022,),),
                      Row(
                        children: [
                          Text("20k Views",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),
                          SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                          Text("2 days ago",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.018,),),

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
               Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.0,top: MediaQuery.of(context).size.height*.02 ),
                    child: Image.asset("assets/images/video2.png",height:MediaQuery.of(context).size.height*.294 ,),
                  ),
                  Positioned(
                      top:  MediaQuery.of(context).size.height*.13,
                      child: Image.asset("assets/images/Pause.png",height: MediaQuery.of(context).size.height*.08 ,width:  MediaQuery.of(context).size.height*.08,))
                ],
              ),
          ],
        ),
      ),
    ),

    );
  }
}

class CommentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.01,left:MediaQuery.of(context).size.width* 0.03, right:MediaQuery.of(context).size.width* 0.03, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(

            child: Container(
              height: MediaQuery.of(context).size.height*.005,
              width: MediaQuery.of(context).size.width*.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                  color: Colors.grey.withOpacity(.5)
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Comments',
                      style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.05,color: Colors.black,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                    Text(
                      '22k',
                      style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.black.withOpacity(.5), ),
                    ),
                  ],
                ),
              Icon(Icons.close,size:MediaQuery.of(context).size.width * 0.06,color: Colors.black.withOpacity(.5),)
              ],
            ),
          ),
          Divider(), // Add a divider below the title
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal:MediaQuery.of(context).size.width*.02  ),
              child: ListView(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                            width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(.5),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KaDhare Finley · 7mo ago ",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(
                              width:MediaQuery.of(context).size.width * 0.7,
                              child: Text("The Struggle was real when he was trying to hit the timer",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                          Container(

                              child: Text("10  replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

                        ],
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
                      Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
                    ],
                  ),

                  // Add more previous comments here
                ],
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01 ),
            child: Stack(
             alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type your comment here',
                    hintStyle: GoogleFonts.lato(),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01,horizontal: MediaQuery.of(context).size.width* 0.04 )
                  ),

                ),
                Positioned(
                  right:  MediaQuery.of(context).size.width * 0.02,
                    child: Icon(Icons.send,color: Color(0xFF1F588E),size: MediaQuery.of(context).size.width * 0.08 ,))
              ],
            ),
          ),
          SizedBox(height: 16.0),

        ],
      ),
    );
  }
}