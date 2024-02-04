import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressDetail extends StatelessWidget {
  const AddressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*.005,),
        Container(
            alignment: AlignmentDirectional.topStart,
            child: Text("456, Shanti Nagar, Pune, Maharashtra \n411028, India",style: GoogleFonts.poppins(fontSize:16 ),)),
        SizedBox(height: MediaQuery.of(context).size.height*.03,),
        Container(
            alignment: AlignmentDirectional.topStart,
            child: Text("+91 9667839945",style:  GoogleFonts.poppins(fontSize:16 ),)),
      ],
    );
  }
}
