import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/shopping/view/widgets/calling.dart';
import 'package:growlife/src/feature/order/view/myorder.dart';
import 'package:growlife/src/feature/tracking/view/widgets/status.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    CommonAppBar(
        title: "Tracking",
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.03,vertical:MediaQuery.of(context).size.height*.025  ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(ShopAssets.product_detail,height:MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.height*.1,),
                      SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                      Column(
                        children: [
                          Text("Rubber Plant",style: GoogleFonts.poppins(fontSize: 14),),
                          SizedBox(height:MediaQuery.of(context).size.height*.005 ,),

                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("₹120      Qty:1",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),)),
                          SizedBox(height:MediaQuery.of(context).size.height*.005 ,),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    height:  MediaQuery.of(context).size.height*.023,
                                    width:  MediaQuery.of(context).size.width*.12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                                        color: AppColor.lightGreenColor
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.007 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("3.8",style: GoogleFonts.poppins(fontSize: 12,color: Colors.white)),
                                          Icon(Icons.star,color: Colors.white,size: 12 ,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.height*.018 ,),
                              const Text("    ")
                            ],
                          ),
                          

                        ],
                      ),
                    ],
                  )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*.1,
              width:MediaQuery.of(context).size.width*1, 
              color: Colors.black.withOpacity(.05),

                child:Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*.02),
                    Text("Estimated Delivery",style:  GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400),),
                    SizedBox(height: MediaQuery.of(context).size.height*.006),
                    Text("30 Jul 2023 : 05:30 PM",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w300),)

                  ],
                ),
              ),
            SizedBox( height: MediaQuery.of(context).size.height*.03),
            Container(
              height: MediaQuery.of(context).size.height*.05,
              width:MediaQuery.of(context).size.width*1,
              color: Colors.black.withOpacity(.1),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Track Order",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400),),
                      Text("#1000205",style:  GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w300),),
                    ],
                  ),
                )


            ),
            Padding(
                 padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TrackingStatusWidget(status: 'Pick-up Request Acepted',time: "9:10 AM, 26 Jul 2023",),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                      child: Container(
                        height: MediaQuery.of(context).size.height*.05,
                          width: MediaQuery.of(context).size.width*.003,
                        color: const Color(0xFF327E47),
                      ),
                    ),
                    TrackingStatusWidget(status: 'Product Picked & started Journey',time: "12:10 AM, 26 Jul 2023",),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                      child: Container(
                        height: MediaQuery.of(context).size.height*.05,
                        width: MediaQuery.of(context).size.width*.003,
                        color: const Color(0xFF327E47),
                      ),
                    ),
                    TrackingStatusWidget(status: 'Dispatch in local wear house',time: "2:10 PM, 28 Jul 2023",),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                      child: DottedLine(
                        direction: Axis.vertical, // Set the direction of the dotted line
                        lineLength: MediaQuery.of(context).size.height*.06, // Set the length of the line
                        lineThickness: MediaQuery.of(context).size.height*.0022,         // Set the thickness of the line
                        dashLength:MediaQuery.of(context).size.height*.0032 ,            // Set the length of each dash
                        dashColor: Colors.grey,     // Set the color of the dashes
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                           height: MediaQuery.of(context).size.height*.042,
                           width: MediaQuery.of(context).size.width*.1,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width:MediaQuery.of(context).size.width*.04 ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Parcale Delivered"
                              ,
                              style:  GoogleFonts.roboto(fontSize: 16,),
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time,color: Colors.black26,size:MediaQuery.of(context).size.height*.02 ,),
                                Text("12:10 AM, 30 Jul 2023",style:  GoogleFonts.roboto(fontSize: 14,color: Colors.black38)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
              ),
               ),
            Container(
              height:MediaQuery.of(context).size.height*.18,
              width: MediaQuery.of(context).size.width*1,
              decoration: const BoxDecoration(
                  color: Colors.white,

              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.04),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
                      child: Row(
                        children: [
                          Text("Deliver to :",style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
                          SizedBox(width: MediaQuery.of(context).size.height*.01,),
                          Text("Tara Choudhary",style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600)),
                          SizedBox(width: MediaQuery.of(context).size.height*.04,),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("456, Shanti Nagar, Pune, Maharashtra \n411028, India ",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400) )),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: RichText(
                                text: TextSpan(
                                 children: <TextSpan>[
                                         TextSpan(
                                             text: 'Mob number: ',
                                                    style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                                                    ),
                                              TextSpan(text:"+91 9667839945" ,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black)),
                                           ],
                                             ),
                                               ),
                    )
                  ],
                ),
              ),

            ),
            Container(
              height:MediaQuery.of(context).size.height*.12,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.blueGrey.withOpacity(.3)
                    )
                  ]
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.04),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
                      child: Row(
                        children: [
                          Text("Driver Details :",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500)),
                          SizedBox(width: MediaQuery.of(context).size.height*.01,),


                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height*.07,
                          width: MediaQuery.of(context).size.width*.12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(ShopAssets.deliveryboy,fit: BoxFit.contain,),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.01),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Viraj Shah",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500)),
                                  Text("+91 9634583105",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400)),

                                ],
                              ),
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width*.13,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>const Calling()));
                              },
                                child: Icon(Icons.phone,color: Colors.green,size:MediaQuery.of(context).size.height*.025 ,)),
                            SizedBox(width:MediaQuery.of(context).size.width*.04 ,),
                            Icon(Icons.chat_bubble_outline_outlined,color: Colors.green,size:MediaQuery.of(context).size.height*.025 )
                          ],
                        )
                      ],
                    )

                  ],
                ),
              ),

            ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.04,vertical: MediaQuery.of(context).size.height*.01),
               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.headset_mic_outlined,color:Colors.black,size:25,),
                       SizedBox(width: MediaQuery.of(context).size.width*.02,),
                       Text("Customer Help",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 18),),
                     ],
                   ),
                   SizedBox( height: MediaQuery.of(context).size.height*.01),
                   Text("Our customer support team is ready to help with any inquiries or concerns. Reach out, and we'll take care of the rest.",style: GoogleFonts.poppins(fontSize:14, ),),
                   SizedBox( height: MediaQuery.of(context).size.height*.02),
                   Container(
                     alignment: AlignmentDirectional.topStart,
                     child: Container(
                       height: MediaQuery.of(context).size.height*.045 ,
                       width:  MediaQuery.of(context).size.width*.25,
                       decoration: BoxDecoration(
                           color: AppColor.lightGreenColor,
                         borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.02)
                       ),
                       child: Center(child: Text("Get Help",style: GoogleFonts.poppins(fontWeight: FontWeight.w500
                           ,fontSize: 18,color: Colors.white ),)),
                     ),
                   )
                 ],
               ),
             )


          ],
        ),
      ),
    );
  }
}