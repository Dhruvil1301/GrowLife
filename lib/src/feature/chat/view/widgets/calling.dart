import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';

class UserCalling extends StatelessWidget {

  const UserCalling({Key? key}) : super(key: key);
  static const routePath="/usercalling";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                    child: Image.asset(ImageAssets.circularimg1)),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("John Deo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 20),),
                ),
                Text("Calling",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.black45),),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.msgContainerColor,
                  radius: 25,
                  child: Icon(Icons.volume_up_sharp,color: AppColor.greenColor,size: 20,),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 35,
                  child: Icon(Icons.call_end,color: Colors.white,size: 25,),
                ),
                CircleAvatar(
                  backgroundColor: AppColor.msgContainerColor,
                  radius: 25,
                  child: Icon(Icons.mic_off,color: AppColor.greenColor,size: 20,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
