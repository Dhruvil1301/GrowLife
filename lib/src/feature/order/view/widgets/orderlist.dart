import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/feedback/view/feedback.dart';
import 'package:growlife/src/feature/order/view/widgets/orderdetail.dart';
class OrderList extends StatelessWidget {
  final String name;
  final String image;
  final String delDate;
  final String num;
  const OrderList({Key? key, required this.name, required this.image, required this.delDate, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.03 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image,height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                SizedBox(width:  MediaQuery.of(context).size.width*.03,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Delivered on ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                        Text(delDate,style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                    Row(
                      children: [
                        Text(name,style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black38 ),),
                        SizedBox(width:  MediaQuery.of(context).size.width*.27,),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.021,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                    Row(
                      children: [
                        Text("Order No. ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.021, ),),
                        Text(num,style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.021, ),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.05 ),
          child: Container(
            height:MediaQuery.of(context).size.height*.0005 ,
            width: MediaQuery.of(context).size.width*1,
            color: Colors.black38,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFeedback()));
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
            child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text("ADD FEEDBACK",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021,color: Color(0xFF1F588E) ),)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
        Container(
          height:MediaQuery.of(context).size.height*.0005 ,
          width: MediaQuery.of(context).size.width*1,
          color: Colors.black45,
        ),
      ],
    );
  }
}
