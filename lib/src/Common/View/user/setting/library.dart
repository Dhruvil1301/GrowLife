import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/user/setting/Setting.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
        children: [
             InkWell(
               onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
           },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
                 SizedBox(width:  MediaQuery.of(context).size.width*.06,),
                  Text("Library",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.width*.07,fontWeight: FontWeight.bold),),


    ],
      ),
    ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.030,vertical: MediaQuery.of(context).size.height*.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Recent",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.055 ),),
                SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset("assets/images/historyimg.png",width:MediaQuery.of(context).size.width*.45,),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      minHeight: MediaQuery.of(context).size.height*.008,
                                      value: .8,// Set the background color
                                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8CDC98)),
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
                                      child: Center(child: Text("03:50",style: GoogleFonts.lato(color: Colors.white),)),
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
                                        child: Text("Nurturing Nature- A growing plant event",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*.042 ),)),
                                    Icon(Icons.more_vert_sharp,size: MediaQuery.of(context).size.width*.06,color: Colors.black54,)
                                  ],
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                                Text("Isabella",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04,color: Colors.black54 ),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.030,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset("assets/images/historyimg.png",width:MediaQuery.of(context).size.width*.45 ,),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.grey,
                                    minHeight: MediaQuery.of(context).size.height*.008,
                                    value: 1,// Set the background color
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8CDC98)),
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
                                    child: Center(child: Text("0:50",style: GoogleFonts.lato(color: Colors.white),)),
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
                                      child: Text("Green Thumb Preview",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*.042 ),)),
                                  Icon(Icons.more_vert_sharp,size: MediaQuery.of(context).size.width*.06,color: Colors.black54,)
                                ],
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                              Text("Growlife",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04,color: Colors.black54 ),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.030,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [

                              Image.asset("assets/images/historyimg.png",width:MediaQuery.of(context).size.width*.45 ,),
                              Positioned(
                                bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                    minHeight: MediaQuery.of(context).size.height*.008,
                                    value: .8,// Set the background color
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8CDC98)),
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
                                    child: Center(child: Text("03:50",style: GoogleFonts.lato(color: Colors.white),)),
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
                                      child: Text("Bridal Makeup",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*.042 ),)),
                                  Icon(Icons.more_vert_sharp,size: MediaQuery.of(context).size.width*.06,color: Colors.black54,)
                                ],
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                              Text("Revlon",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04,color: Colors.black54 ),)
                            ],
                          )
                        ],
                      )
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
                    Icon(Icons.history,size: MediaQuery.of(context).size.width*.07),
                    SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                    Text("History",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.052 ),)

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time,size: MediaQuery.of(context).size.width*.07),
                    SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Watch Later",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.05 ),),
                        Text("4 unwatched videos",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.035,color: Colors.black38 ),),
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
                    Text("Playlists",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.05,fontWeight: FontWeight.bold ),),
                    SizedBox(width:MediaQuery.of(context).size.width*.38 ,),
                    Text("Recently added",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.045 ),),
                    SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                    Image.asset("assets/images/arrowdown.png",width: MediaQuery.of(context).size.width*.045,)

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add,size: MediaQuery.of(context).size.width*.07,color: Color(0xFF068BFF),),
                    SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
                    Text("New Playlist",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.052,color: Color(0xFF068BFF) ),)

                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/naturing.png",width:MediaQuery.of(context).size.width*.08 ,height: MediaQuery.of(context).size.height*.05,),
                    SizedBox(width:MediaQuery.of(context).size.width*.04 ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Naturing nature",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.05 ),),
                        Text("16 videos",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.035,color: Colors.black38 ),),
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
