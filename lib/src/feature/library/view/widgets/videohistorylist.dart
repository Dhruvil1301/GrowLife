import"package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class VideoHistory extends StatelessWidget {
  final String video;
  final String duration;
  final String title;
  final String owner;
  const VideoHistory({Key? key, required this.video, required this.duration, required this.title, required this.owner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(video,width:MediaQuery.of(context).size.width*.45,),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    minHeight: MediaQuery.of(context).size.height*.008,
                    value: .8,// Set the background color
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8CDC98)),
                  )),
              Positioned(
                  bottom:MediaQuery.of(context).size.height*.02 ,
                  right: MediaQuery.of(context).size.width*.02,
                  left: MediaQuery.of(context).size.width*.33,
                  child: Container(
                    height: MediaQuery.of(context).size.height*.02,
                    width: MediaQuery.of(context).size.width*.01,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(child: Text(duration,style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10),)),
                  )),
            ],
          ),
          SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height:MediaQuery.of(context).size.height*.05 ,
                      width:  MediaQuery.of(context).size.width*.4,
                      child: Text(title,style: GoogleFonts.roboto(fontWeight:FontWeight.w400,fontSize:14 ),)),
                  const Icon(Icons.more_vert_sharp,size: 25,color: Colors.black54,)
                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
              Text(owner,style: GoogleFonts.roboto(fontWeight:FontWeight.w400,fontSize:12,color: Colors.black54 ),)
            ],
          )
        ],
      ),
    );
  }
}
