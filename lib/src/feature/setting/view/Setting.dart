import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/notification/view/notification.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/feature/help/view/help.dart';
import 'package:growlife/src/feature/invite/view/invite_a_friend.dart';
import 'package:growlife/src/feature/library/view/library.dart';
import 'package:growlife/src/feature/privacypolicy/view/privacypolicy.dart';
import 'package:growlife/src/feature/auth/view/signupscreen.dart';
import 'package:growlife/src/utils/route.dart';
class Setting extends StatefulWidget {

  const Setting({Key? key}) : super(key: key);
  static const routePath="/setting";
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar:  CommonAppBar(title: "Setting"),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.05 ,horizontal: MediaQuery.of(context).size.height*.02 ),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  router.push(Profile.routePath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text("Account Center",style: GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Icon(Icons.lock_outline,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                    Text("Privacy",style:  GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.height*.255 ,),
                    Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                  ],
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
              InkWell(
                onTap: (){
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.notifications_none_rounded,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                    Text("Notification",style:  GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.height*.2005 ,),
                    Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                  ],
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
              InkWell(
                onTap: (){
                 router.push(Library.routePath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.library_add_check_outlined,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.width*.025 ,),
                    Text("Library",style:  GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.width*.56 ,),
                    Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                  ],
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(EvaIcons.globe,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                  SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                  Text("Language",style: GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                  SizedBox(width:MediaQuery.of(context).size.height*.23 ,),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
              InkWell(
                onTap: (){
                router.push(InviteAFriend.routePath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.people,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                    Text("Invite a Friend",style: GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.height*.173 ,),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.help_outline_sharp,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                    Text("Help",style:  GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.height*.285 ,),
                    Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size:MediaQuery.of(context).size.height*.025)
                  ],
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05 ,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShimmerScreenSuccessSignup()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.logout,color:Colors.black,size:MediaQuery.of(context).size.height*.035,),
                    SizedBox(width:MediaQuery.of(context).size.height*.015 ,),
                    Text("Logout",style:  GoogleFonts.poppins(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400 ),),
                    SizedBox(width:MediaQuery.of(context).size.height*.255 ,),
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
