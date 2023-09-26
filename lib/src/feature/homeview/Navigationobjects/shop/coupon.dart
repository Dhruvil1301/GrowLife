import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/shopping.dart';
class Coupon extends StatefulWidget {
  const Coupon({Key? key}) : super(key: key);

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,

        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopping()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Coupon",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<10;i++)
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.03,right: MediaQuery.of(context).size.height*.03,top: MediaQuery.of(context).size.height*.03 ),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                height: MediaQuery.of(context).size.height*.15,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: Colors.blueGrey.withOpacity(.3)
                    )
  ]
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01,vertical: MediaQuery.of(context).size.height*.01 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/shop/pecentage.png",height: MediaQuery.of(context).size.height*.02, width: MediaQuery.of(context).size.width*.045),
                          SizedBox(width: MediaQuery.of(context).size.width*.02,),
                          Text("60% OFF up to ₹120",style: GoogleFonts.lato(fontWeight:FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.024 ),),
                          SizedBox(width: MediaQuery.of(context).size.width*.14,),
                          Text("APPLY",style: GoogleFonts.lato(fontWeight:FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E) ),),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.07,),
                          Text("Save ₹119.4 with this code",style: GoogleFonts.lato(color:Color(0xFF1F588E),fontSize:MediaQuery.of(context).size.height*.017  ),),
                        ],
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.015 ,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.07,),
                          Container(
                              height: MediaQuery.of(context).size.height*.05,
                              width: MediaQuery.of(context).size.width*.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.01),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black38,
                                width: 0.5,
                              )
                            ),
                            child: Center(child: Text("GROWPLANT",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.021,fontWeight: FontWeight.bold),)),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.1,),
                          Text("View Details",style: GoogleFonts.lato(color: Colors.black38,fontSize:MediaQuery.of(context).size.height*.019  ),),
                          Icon(Icons.arrow_drop_down_sharp,color: Colors.black38,size: MediaQuery.of(context).size.height*.03  ,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
