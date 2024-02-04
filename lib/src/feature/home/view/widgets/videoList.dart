import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoList extends StatelessWidget {
   final String ownerName;
   final String ownerImg;
   final String views;
   final String timeofUploading;
   final String video;
   final String videoTitle;
   final VoidCallback? onTap;
  const VideoList({Key? key, required this.ownerName, required this.ownerImg, required this.views, required this.timeofUploading, required this.video, required this.videoTitle, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(ownerImg,height:MediaQuery.of(context).size.height*.06 ,),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ownerName,style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize:  16),),
                  Row(
                    children: [
                      Text(views,style: GoogleFonts.poppins(fontSize:  13,fontWeight: FontWeight.w500),),
                      SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                      Text(timeofUploading,style: GoogleFonts.poppins(fontSize:  13,fontWeight: FontWeight.w400),),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width:MediaQuery.of(context).size.height*.11 ,),
            Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.022),
              child: Icon(Icons.more_vert_sharp,color: Colors.black,size:30,),
            )

          ],
        ),
        InkWell(
          onTap:(){
            onTap?.call();
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.022,top: MediaQuery.of(context).size.height*.02 ),
                child: Image.asset(video),
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
            child: Text(videoTitle,style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),)),
        SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
      ],
    );
  }
}
