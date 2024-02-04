import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HelpQuestionList extends StatelessWidget {
  final String question;
  final VoidCallback? onTap;

  const HelpQuestionList({Key? key, required this.question, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: (){
             onTap!.call();
            },
            child: Text(question,style: GoogleFonts.poppins(fontSize:18,color: Colors.blue),)),
        SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
      ],
    );
  }
}
