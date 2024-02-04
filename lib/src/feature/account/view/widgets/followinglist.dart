import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';

class FollowingList extends StatelessWidget {
  final String image;
  final String name;
  final String phoneNum;
  const FollowingList({Key? key, required this.image, required this.name, required this.phoneNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.023),
      child: Row(
          children:[
            Image.asset(image,height:MediaQuery.of(context).size.height*.06),
            SizedBox(width: MediaQuery.of(context).size.height*.02,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w600 ),),
                Text(phoneNum,style:GoogleFonts.plusJakartaSans(fontSize:14,fontWeight: FontWeight.w500 ),
                ),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.height*.07,),
            Container(
              height:MediaQuery.of(context).size.height*.05 ,
              width: MediaQuery.of(context).size.width*.25,
              decoration: BoxDecoration(
                  color:AppColor.blueButtonColor,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01)
              ),
              child: Center(child: Text("Following",style: GoogleFonts.plusJakartaSans(color: Colors.white,fontSize:16,fontWeight: FontWeight.w600),)),
            )
          ]
      ),
    );
  }
}
