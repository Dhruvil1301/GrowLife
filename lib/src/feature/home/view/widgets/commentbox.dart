import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Commentbox extends StatelessWidget {
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