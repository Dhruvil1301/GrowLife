import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/order/view/widgets/adddonation.dart';
import 'package:growlife/src/feature/order/view/widgets/addressdetail.dart';
import 'package:growlife/src/feature/shopping/view/widgets/edit_address.dart';
import 'package:growlife/src/feature/shopping/view/widgets/paymentmethod.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
class OrderSummary extends StatefulWidget {



  const OrderSummary({Key? key}) : super(key: key);
  static const routePath="/ordersummary";

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:    CommonAppBar(
        title: "Order Summary",
      ),
       bottomNavigationBar: Builder(
        builder: (BuildContext context) => BottomNavigationBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            child: Column(
              children: [
                Text(
                  "₹120",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Total",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18),
                )
              ],
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            child: GestureDetector(
              onTap: () {
               router.push(PaymentMethod.routePath);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .42,
                height: MediaQuery.of(context).size.width * .12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * .01),
                  border: Border.all(color: const Color(0xFF268E15)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style: GoogleFonts.poppins(fontSize: 25, color: AppColor.lightGreenColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          label: '',
        ),
      ],
    ),
    ),

    body: SingleChildScrollView(
        child: Column(
           children: [
             Center(child: Image.asset(ShopAssets.ordersummary,height:MediaQuery.of(context).size.height*.1 ,width: MediaQuery.of(context).size.height*.3,)),
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
                          Text("Deliver to :",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:18 ),),
                          SizedBox(width: MediaQuery.of(context).size.height*.01,),
                          Text("Tara Choudhary",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16),),
                          SizedBox(width: MediaQuery.of(context).size.height*.04,),
                          InkWell(
                            onTap: (){
                              router.push(EditAddress.routePath);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.04 ,
                              width:  MediaQuery.of(context).size.width*.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.013),
                                border: Border.all(
                                  color:  AppColor.primary
                                )
                              ),
                              child: Center(child: Text("Change",style: GoogleFonts.poppins(fontSize:16,color: AppColor.primary ),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AddressDetail()
                  ],
                ),
              ),
            ),
                Column(
                 children: [
                   AddDonation(),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.asset(ShopAssets.product_detail,height:MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.height*.1,),
                             SizedBox(width:MediaQuery.of(context).size.height*.01 ,),
                             Column(
                               children: [
                                 Text("Rubber Plant",style: GoogleFonts.poppins(fontSize: 12),),
                                 SizedBox(height:MediaQuery.of(context).size.height*.005 ,),

                                 Container(
                                   alignment: AlignmentDirectional.topStart,
                                     child: Text("₹120      Qty:1",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 12),)),
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
                                              color: const Color(0xFF268E15)
                                           ),
                                         child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.007 ),
                                         child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           children: [
                                         Text("3.8",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),),
                                          Icon(Icons.star,color: Colors.white,size: MediaQuery.of(context).size.height*.018 ,)
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
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02,vertical:MediaQuery.of(context).size.height*.01  ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                       child: Row(
                         children: [
                           Text("Delivery by Fir Jul 21",style: GoogleFonts.poppins(fontSize: 12),),
                           SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
                           Text("Free Delivery",style: GoogleFonts.lato(color:AppColor.lightGreenColor,fontSize: 12),),
                           SizedBox(width:MediaQuery.of(context).size.width*.2 ,),
                           Icon(Icons.arrow_forward_ios_outlined,size:20 ,)
                         ],
                       ),
                     ),
                   ),

                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                       alignment: AlignmentDirectional.topStart,
                         child: Row(
                           children: [
                             Icon(Icons.close,size: 20,),
                             Text("Remove",style: GoogleFonts.poppins(color: Colors.black54,fontSize: 12),),
                           ],
                         )),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.03 ,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                         alignment: AlignmentDirectional.topStart,
                         child: Text("Price Details (1 Items)",style: GoogleFonts.poppins(fontSize:18 ),)),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.01,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                     child: Container(
                         alignment: AlignmentDirectional.topStart,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Total Product Price",style: GoogleFonts.poppins(fontSize:16 ),),
                             Text("₹120",style: GoogleFonts.poppins(fontSize:16 ),),
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
                             Text("Delivery Charge",style: GoogleFonts.poppins(fontSize:18 ),),
                             Text("Free Delivery",style: GoogleFonts.poppins(fontSize:14,color: AppColor.lightGreenColor ),),
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
