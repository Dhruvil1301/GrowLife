import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AddDonation extends StatelessWidget {
  const AddDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Text("Donate to GrowLife Foundation",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w500,wordSpacing: 1 ),),
                Text("Support transformation social work in India",style: GoogleFonts.lato(fontSize: 12,color: Colors.black38 ),),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.01,),
        Container(
          height:MediaQuery.of(context).size.height*.001,
          width:MediaQuery.of(context).size.width*1,
          color: Colors.blueGrey.withOpacity(.6),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.06,vertical: MediaQuery.of(context).size.height*.012),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.02,
                width:  MediaQuery.of(context).size.height*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.02),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child:  Center(child: Text("₹10",style: GoogleFonts.poppins(fontSize: 12),)),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.02,
                width:  MediaQuery.of(context).size.height*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.02),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child:  Center(child: Text("₹20",style: GoogleFonts.poppins(fontSize: 12),)),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.02,
                width:  MediaQuery.of(context).size.height*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.02),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Center(child: Text("₹50",style: GoogleFonts.poppins(fontSize: 12),)),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.02,
                width:  MediaQuery.of(context).size.height*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.02),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Center(child: Text("₹100",style: GoogleFonts.poppins(fontSize: 12),)),
              ),
            ],
          ),
        ),
        Container(
          height:MediaQuery.of(context).size.height*.001,
          width:MediaQuery.of(context).size.width*1,
          color: Colors.blueGrey.withOpacity(.6),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
          child: Container(
              alignment:AlignmentDirectional.topStart,
              child: Text("Note :- GST & No Cost EMI will not be applicable",style: GoogleFonts.poppins(fontSize: 12,color: Colors.black38 ),)),
        ),
        Container(
          height:MediaQuery.of(context).size.height*.001,
          width:MediaQuery.of(context).size.width*1,
          color: Colors.blueGrey.withOpacity(.6),
        ),
        SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
      ],
    );
  }
}

