import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class InviteList extends StatelessWidget {
  final String image;
  final String name;
  final String phoneNum;
  final bool invited;
  const InviteList({Key? key, required this.image, required this.name, required this.phoneNum, required this.invited}) : super(key: key);

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
                Text(name,style:GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize: 16)),
                Text(phoneNum,style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 14),
                ),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.height*.13,),
           invited?  Container(
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:  Color(0xFF8CDC98),
                )
            )


          ]
      ),
    );
  }
}
