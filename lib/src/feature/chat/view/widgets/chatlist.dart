import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';
class ChatList extends StatelessWidget {
  final String image;
  final String name;
  final String lastMsg;
  final String lastMsgTime;
  final String? No_of_unreadMsg;
  final bool unreadMsg;
  final VoidCallback? onTap;

  const ChatList({Key? key, required this.image, required this.name, required this.lastMsg, required this.lastMsgTime, this.No_of_unreadMsg, required this.unreadMsg, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: (){
          onTap?.call();
        },
        leading: CircleAvatar(
          radius: 25,
          child: Image.asset(image),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(name,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14),),
            Text(lastMsgTime,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.black45),),

          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lastMsg,style: GoogleFonts.lato(fontSize: 12,color: Colors.black45),),
           unreadMsg==true? Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.greenColor,
              ),
              child: Center(child: Text(No_of_unreadMsg!,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),)),
            ):const SizedBox(),
          ],
        ),
      ),
    );
  }
}
