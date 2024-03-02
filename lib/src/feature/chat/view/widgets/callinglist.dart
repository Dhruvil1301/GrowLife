import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';
class CallingList extends StatelessWidget {
  final String image;
  final String name;
  final String status;  // Received,missed,or answer
  final String time;
  const CallingList({Key? key, required this.image, required this.name, required this.status, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading:  CircleAvatar(
          backgroundColor: Colors.grey,
          radius:25,
          child: Image.asset(image),
        ),
        title: Text(name,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14),),
        subtitle: Row(
          children: [
            status=="Received"?
             const Icon(Icons.call_received,color: AppColor.greenColor,size: 15,):status=="Answered"? const Icon(Icons.call_made,color: AppColor.greenColor,size: 15,):const Icon(Icons.call_received,color: Colors.red,size: 15,),
            const SizedBox(width: 2,),
            Text("$status,",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 12,color: status=="Missed"?Colors.red:Colors.black38),),
            const SizedBox(width: 2,),
            Text(time, style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 12,color: status=="Missed"?Colors.red:Colors.black38),)

          ],
        ),
        trailing: const Icon(Icons.call,size: 25,),
      ),
    );
  }
}
