import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/pages/notification.dart';
import 'package:growlife/src/Common/View/user/profile.dart';
import 'package:growlife/src/Common/View/user/setting/help.dart';
import 'package:growlife/src/Common/View/user/setting/invite_a_friend.dart';
import 'package:growlife/src/Common/View/user/setting/privacypolicy.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Setting",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),


          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.05 ,horizontal: MediaQuery.of(context).size.height*.02 ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:Border.all(
                        width: 2,
                        color: Colors.black
                      )
                    ),
                      child: Icon(Icons.person,color:Colors.black,size:MediaQuery.of(context).size.height*.035,)),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Account Center",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.15 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
              },
              child: Row(
                children: [
                   Icon(Icons.lock_outline,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Privacy",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.255 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
              },
              child: Row(
                children: [
                  Icon(Icons.notifications_none_rounded,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Notification",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.2005 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            Row(
              children: [
                Icon(EvaIcons.sun,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                Text("Theme",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                SizedBox(width:MediaQuery.of(context).size.height*.262 ,),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            Row(
              children: [
                Icon(EvaIcons.globe,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                Text("Language",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                SizedBox(width:MediaQuery.of(context).size.height*.23 ,),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InviteAFriend()));
              },
              child: Row(
                children: [
                  Icon(Icons.people,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Invite a Friend",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.175 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
              },
              child: Row(
                children: [
                  Icon(Icons.help_outline_sharp,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Help",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.027 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.285 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
