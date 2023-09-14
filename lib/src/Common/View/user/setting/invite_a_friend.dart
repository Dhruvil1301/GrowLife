import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/user/setting/Setting.dart';
class InviteAFriend extends StatefulWidget {
  const InviteAFriend({Key? key}) : super(key: key);

  @override
  State<InviteAFriend> createState() => _InviteAFriendState();
}

class _InviteAFriendState extends State<InviteAFriend> {



  bool isSearching = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title:  isSearching? TextField(
          // Customize the TextField for search
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
            hintStyle: GoogleFonts.lato(),
            border: InputBorder.none,
          ),
        ): Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Invite a Friend",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
            SizedBox(width:  MediaQuery.of(context).size.height*.119,),
            IconButton(
              icon: Icon(Icons.search,color: Colors.black,size:MediaQuery.of(context).size.height*.030 ,),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
            ),


          ],
        ),


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical: MediaQuery.of(context).size.height*.030),
          child: Column(
            children: [
              Image.asset("assets/images/invite_a_friend_msg.png"),
              Row(
                children: [
                  Text("From Contacts",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold),),
                  SizedBox(width:  MediaQuery.of(context).size.height*.06,),

                  CircleAvatar(
                    backgroundColor: Color(0xFF0FA958),
                    radius: MediaQuery.of(context).size.height*.025,
                    child: Icon(EvaIcons.share,color: Colors.white,size: MediaQuery.of(context).size.height*.030,),
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.height*.01,),
                  Text("Share Link",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
                ],
              ),
              for(int i=0;i<9;i++)
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.023),
                  child: Row(
                      children:[
                    i==0||i==2||i==4||i==6||i==8?    Image.asset("assets/images/circularimg2.png",height:MediaQuery.of(context).size.height*.06): Image.asset("assets/images/circularimg1.png",height:MediaQuery.of(context).size.height*.06),
                        SizedBox(width: MediaQuery.of(context).size.height*.02,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            i==0||i==2||i==4||i==6||i==8?  Text("ROY",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),):Text("Isabella",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),),
                            Text("+919645348799",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.018),
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height*.13,),
                        i==1||i==5||i==9||i==10||i==7?  Container(
                          height:MediaQuery.of(context).size.height*.015 ,
                          width: MediaQuery.of(context).size.width*.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black
                            )
                          )
                        ):Container(
                            height:MediaQuery.of(context).size.height*.015 ,
                            width: MediaQuery.of(context).size.width*.08,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                 color:  Color(0xFF8CDC98),
                                )
                            )


                      ]
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
