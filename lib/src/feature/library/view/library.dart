import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/library/view/widgets/videohistorylist.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/res/assets.dart';

class Library extends StatefulWidget {
  static const routePath="/library";

  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: "Library"),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.030,vertical: MediaQuery.of(context).size.height*.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Recent",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400),),
                SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const VideoHistory(video: ImageAssets.historyimg, duration: "03:50", title: "Nurturing Nature- A growing plant event", owner: "Isabella"),
                      SizedBox(width: MediaQuery.of(context).size.width*.030,),
                      const VideoHistory(video: ImageAssets.historyimg, duration: "0:50", title: "Green Thumb Preview", owner: "GrowLife"),
                      SizedBox(width: MediaQuery.of(context).size.width*.030,),
                      const VideoHistory(video: ImageAssets.historyimg, duration: "0:50", title: "Green Thumb Preview", owner: "GrowLife"),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*.030 ,),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.030,vertical: MediaQuery.of(context).size.height*.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.history,size:25),
                    SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                    Text("History",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400 ),)

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time,size: 25),
                    SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Watch Later",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400 ),),
                        Text("4 unwatched videos",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400,color: Colors.black38 ),),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*.010 ,),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.030,vertical: MediaQuery.of(context).size.height*.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(

                  children: [
                    Text("Playlists",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w500 ),),
                    SizedBox(width:MediaQuery.of(context).size.width*.36 ,),
                    Text("Recently added",style:GoogleFonts.roboto(fontSize:14,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                    IconButton(onPressed: (){

                    }, icon: const Icon(Icons.expand_more,size: 25,))

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add,size: MediaQuery.of(context).size.width*.07,color: Colors.blue),
                    SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
                    Text("New Playlist",style:GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400,color: Colors.blue ),)

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImageAssets.naturing,width:MediaQuery.of(context).size.width*.08 ,height: MediaQuery.of(context).size.height*.05,),
                    SizedBox(width:MediaQuery.of(context).size.width*.04 ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Naturing nature",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w400 ),),
                        Text("16 videos",style: GoogleFonts.roboto(fontSize:12,fontWeight: FontWeight.w400,color: Colors.black38 ),),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
