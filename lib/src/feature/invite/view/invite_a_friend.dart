import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/invite/view/widgets/invitelist.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
class InviteAFriend extends StatefulWidget {

  const InviteAFriend({Key? key}) : super(key: key);
  static const routePath="/invitefriend";
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
        elevation: 0,
        title:  isSearching? TextField(
          // Customize the TextField for search
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search...',
            hintStyle: GoogleFonts.lato(),
            border: InputBorder.none,
          ),
        ): Row(
          children: [
            InkWell(
                onTap:(){
                  router.pop();
                },
                child: const Icon(Icons.arrow_back,color: Colors.black,size:  25,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Invite a Friend",style:GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(width:  MediaQuery.of(context).size.height*.119,),


          ],
        ),
        actions: [
          isSearching?SizedBox():IconButton(
            icon: const Icon(Icons.search,color: Colors.black,size:25 ,),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical: MediaQuery.of(context).size.height*.030),
          child: Column(
            children: [
              Image.asset(ImageAssets.invite_a_friend_msg),
              Row(
                children: [
                  Text("From Contacts",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w500),),
                  SizedBox(width:  MediaQuery.of(context).size.height*.05,),

                  CircleAvatar(
                    backgroundColor: AppColor.greenColor,
                    radius: MediaQuery.of(context).size.height*.025,
                    child: Icon(EvaIcons.share,color: Colors.white,size: 20,),
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.height*.01,),
                  Text("Share Link",style:GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w500),),
                ],
              ),
               const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: false),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: false),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: true),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: false),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: true),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: false),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: false),
              const InviteList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799", invited: true),


            ],
          ),
        ),
      ),
    );
  }
}
