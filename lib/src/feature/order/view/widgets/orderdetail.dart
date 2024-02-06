import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/order/view/myorder.dart';
import 'package:growlife/src/feature/shopping/view/widgets/relatedproductlist.dart';
import 'package:growlife/src/feature/tracking/view/tracking.dart';
import 'package:growlife/src/feature/tracking/view/widgets/status.dart';
import 'package:growlife/src/feature/wishlist/view/wishlist.dart';
import 'package:growlife/src/res/assets.dart';
class OrderDetail extends StatefulWidget {

  const OrderDetail({Key? key}) : super(key: key);
  static const routePath="/orderdetail";
  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Order Details",
        action: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 25,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,size: 25,)),
        ],),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Order No.20060230",style:GoogleFonts.poppins(fontSize:18,color: Colors.black54 ),)),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fiddle leaf fig",style: GoogleFonts.poppins(fontSize:18, ),),
                      SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                      Row(
                        children: [
                          Text("₹120",style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w600)),
                          SizedBox(width:  MediaQuery.of(context).size.height*.02,),
                          Container(

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
                                  Text("3.8",style: GoogleFonts.poppins(fontSize:16,color: Colors.white ),),
                                  const Icon(Icons.star,color: Colors.white,size:12,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                      Text("Delivered on Jun 29 , 2023",style:GoogleFonts.poppins(fontSize:16, ),),

                    ],
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.width*.16,),
                  Image.asset(ShopAssets.fiddleleaf,height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TrackingStatusWidget(status: 'Pick-up Request Acepted',time: "",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: const Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Product Picked & started Journey',time: "",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: const Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Dispatch in local wear house',time: "",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: const Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Parcale Delivered',time: "",)

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.015 ,),
              child: Container(

                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.grey
                  )]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.015 ),
                      child: Container(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("You might be also interested in",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w700 ),)),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015, ),
                        child: const Row(
                          children: [
                            RelatedProductList(name: "Fiddle Leaf", price: "100", image: ShopAssets.fiddleleaf),
                            RelatedProductList(name: "Gardening Tool", price: "250", image: ShopAssets.gardentool),
                            RelatedProductList(name: "Fiddle Leaf", price: "100", image: ShopAssets.gardenhoses)
                          ],
                        )
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*.015 ,),
                  ],
                ),
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Shipping Details",style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w500 ,color: Colors.black45),)),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Column(
                children: [

                     Row(
                      children: [
                        Text("Tara Choudhary",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w600, ),),
                      ],
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height*.005,),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("456, Shanti Nagar, Pune, Maharashtra\n411028, India",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18))),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          Text("Mob Number: ",style:  GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18)),
                          SizedBox(width: MediaQuery.of(context).size.width*.03,),
                          Text("+91 9667839945",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Price Details",style:  GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w500 ,color: Colors.black45),)),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.01),
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Selling price",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                          Text("₹120",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                        ],
                      )),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.01),
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping fee",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                          Text("Free",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                        ],
                      )),
                ),
              ],
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.01),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                      Text("₹120",style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18)),
                    ],
                  )),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.02 ,)

          ],
        ),
      ),
    );
  }
}
