import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/edit_address.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/paymentmethod.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/product_detail.dart';
class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Order Summary",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: Column(
                children: [
                  Text("₹120",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.024 ),),
                  Text("Total",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ),)

                ],
              ),

            ),
            label: '',
          ),
          BottomNavigationBarItem(

            icon:
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethod()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width*.42,
                    height: MediaQuery.of(context).size.width*.12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                        border: Border.all(
                            color:  Color(0xFF268E15)
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Continue",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,color:Color(0xFF268E15),fontWeight: FontWeight.bold  ),),


                        ],
                      ),
                    )
                ),
              ),),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [
             Center(child: Image.asset("assets/shop/ordersummary.png",height:MediaQuery.of(context).size.height*.1 ,width: MediaQuery.of(context).size.height*.3,)),
             SizedBox(height:MediaQuery.of(context).size.height*.005 ,),
            Container(
              height:MediaQuery.of(context).size.height*.2,
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
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
                      child: Row(
                        children: [
                          Text("Deliver to :",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.022 ),),
                          SizedBox(width: MediaQuery.of(context).size.height*.01,),
                          Text("Tara Choudhary",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.021 ),),
                          SizedBox(width: MediaQuery.of(context).size.height*.04,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddress()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.04 ,
                              width:  MediaQuery.of(context).size.width*.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.013),
                                border: Border.all(
                                  color:  Color(0xFF1F588E)
                                )
                              ),
                              child: Center(child: Text("Change",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: Color(0xFF1F588E) ),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                        child: Text("456, Shanti Nagar, Pune, Maharashtra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),)),
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("411028, India",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),)),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("+91 9667839945",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),)),
                  ],
                ),
              ),

            ),

                Column(
                 children: [
                   Container(
                     alignment: AlignmentDirectional.topStart,
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                       child: Column(
                         children: [
                           SizedBox(height: MediaQuery.of(context).size.height*.01,),
                           Text("Donate to GrowLife Foundation",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold,wordSpacing: 1 ),),
                           Text("Support transformation social work in India",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.0165,color: Colors.black38 ),),
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
                           child: Center(child: Text("₹10")),
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
                           child: Center(child: Text("₹20")),
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
                           child: Center(child: Text("₹50")),
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
                           child: Center(child: Text("₹100")),
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
                         child: Text("Note :- GST & No Cost EMI will not be applicable",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.0165,color: Colors.black38 ),)),
                   ),
                   Container(
                     height:MediaQuery.of(context).size.height*.001,
                     width:MediaQuery.of(context).size.width*1,
                     color: Colors.blueGrey.withOpacity(.6),
                   ),
                  SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.asset("assets/shop/product_detail.png",height:MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.height*.1,),
                             SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                             Column(
                               children: [
                                 Text("Rubber Plant",style: GoogleFonts.lato(),),
                                 SizedBox(height:MediaQuery.of(context).size.height*.005 ,),

                                 Container(
                                   alignment: AlignmentDirectional.topStart,
                                     child: Text("₹120      Qty:1",style: GoogleFonts.lato(fontWeight: FontWeight.bold),)),
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
                                              color: Color(0xFF268E15)
                                           ),
                                         child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.007 ),
                                         child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           children: [
                                         Text("3.8",style: GoogleFonts.lato(color: Colors.white),),
                                          Icon(Icons.star,color: Colors.white,size: MediaQuery.of(context).size.height*.018 ,)
                                       ],
                                        ),
                                        ),
                                        ),
                                           ),
                                     ),
                                     SizedBox(width: MediaQuery.of(context).size.height*.018 ,),
                                     Text("    ")
                                   ],
                                 ),

                               ],
                             ),
                           ],
                         )
                     ),
                   ),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical:MediaQuery.of(context).size.height*.01  ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                       child: Row(
                         children: [
                           Text("Delivery by Fir Jul 21",style: GoogleFonts.lato(),),
                           SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
                           Text("Free Delivery",style: GoogleFonts.lato(color:Color(0xFF268E15) ),),
                           SizedBox(width:MediaQuery.of(context).size.width*.2 ,),
                           Icon(Icons.arrow_forward_ios_outlined,size:MediaQuery.of(context).size.width*.05 ,)
                         ],
                       ),
                     ),
                   ),

                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                         child: Text("X   Remove",style: GoogleFonts.lato(color: Colors.black54),)),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.03 ,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                         alignment: AlignmentDirectional.topStart,
                         child: Text("Price Details (1 Items)",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold ),)),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.01,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                         alignment: AlignmentDirectional.topStart,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Total Product Price",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),),
                             Text("₹120",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),),
                           ],
                         )),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.01,),

                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                         alignment: AlignmentDirectional.topStart,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Delivery Charge",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022 ),),
                             Text("Free Delivery",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,color: Color(0xFF268E15) ),),
                           ],
                         )),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.02,),
                   Container(
                     height:MediaQuery.of(context).size.height*.001,
                     width:MediaQuery.of(context).size.width*.9,
                     color: Colors.black
                   ),

                 ],
               ),
           ],
        ),
      ),
    );
  }
}
