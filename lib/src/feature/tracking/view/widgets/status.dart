import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';

class TrackingStatusWidget extends StatelessWidget {
  final String status;
  final String time;

  TrackingStatusWidget({required this.status,required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.042,
          width: MediaQuery.of(context).size.width*.1,
          decoration: const BoxDecoration(
            color:AppColor.lightGreenColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        SizedBox(width:MediaQuery.of(context).size.width*.04 ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            Row(
              children: [
                Icon(Icons.access_time,color: Colors.black26,size:MediaQuery.of(context).size.height*.02 ,),
                Text(time,style: GoogleFonts.roboto(fontSize: 14,color: Colors.black38)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}