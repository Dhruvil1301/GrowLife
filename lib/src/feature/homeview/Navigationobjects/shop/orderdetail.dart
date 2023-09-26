import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/myorder.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/tracking.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/wishlist.dart';
class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrder()));
            },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.032,),
            Text("Order Detail",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
            SizedBox(width:  MediaQuery.of(context).size.height*.105,),
            InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishlistPage()));
                },
                child: Icon(Icons.favorite_border,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.015,),
            Icon(Icons.shopping_cart_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: MediaQuery.of(context).size.height*.02),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Order No.20060230",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,color: Colors.black38 ),)),
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
                      Text("Fiddle leaf fig",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023, ),),
                      SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                      Row(
                        children: [
                          Text("₹120",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021,fontWeight: FontWeight.bold)),
                          SizedBox(width:  MediaQuery.of(context).size.height*.02,),
                          Container(

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
                        ],
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
                      Text("Delivered on Jun 29 , 2023",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02, ),),

                    ],
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.width*.16,),
                  Image.asset("assets/shop/fiddleleaf.png",height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
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
                  TrackingStatusWidget(status: 'Pick-up Request Acepted',time: "9:10 AM, 26 Jul 2023",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Product Picked & started Journey',time: "12:10 AM, 26 Jul 2023",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Dispatch in local wear house',time: "2:10 PM, 28 Jul 2023",),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.003,
                      color: Color(0xFF327E47),
                    ),
                  ),
                  TrackingStatusWidget(status: 'Parcale Delivered',time: "11:00AM, 30 Jul 2023",)

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.015 ,),
              child: Container(

                decoration: BoxDecoration(
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
                          child: Text("You might be also interested in",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold,),)),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015, ),
                        child: Row(
                          children: [
                            for(int i=0;i<=3;i++)
                              i==0? Padding(
                                padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height*.020  ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/shop/fiddleleaf.png",height: MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.3,),
                                    SizedBox(height: MediaQuery.of(context).size.height*.013,),
                                    Container(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Text("Fiddle Leaf",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020),)),

                                    Container(
                                        alignment:AlignmentDirectional.topStart,
                                        child: Text("₹100",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.020),))
                                  ],
                                ),
                              ):i==1?Padding(
                                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.015),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/shop/gardentool.png",height: MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.3,),
                                    SizedBox(height: MediaQuery.of(context).size.height*.013,),
                                    Container(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Text("Gardening Tools",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020),)),

                                    Container(
                                        alignment:AlignmentDirectional.topStart,
                                        child: Text("₹250",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.020),))
                                  ],
                                ),
                              ):i==2?Padding(
                                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.015),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/shop/gardenhoses.png",height: MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.3,),
                                    SizedBox(height: MediaQuery.of(context).size.height*.013,),
                                    Container(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Text("Garden Hoses",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020),)),

                                    Container(
                                        alignment:AlignmentDirectional.topStart,
                                        child: Text("₹100",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.020),))
                                  ],
                                ),
                              ):Padding(
                                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.015),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/shop/rubber.png",height: MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.3,),
                                    SizedBox(height: MediaQuery.of(context).size.height*.013,),
                                    Container(
                                        alignment: AlignmentDirectional.topStart,
                                        child: Text("Rubber Plant",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.020),)),

                                    Container(
                                        alignment:AlignmentDirectional.topStart,
                                        child: Text("₹120",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.020),))
                                  ],
                                ),
                              )

                          ],

                        ),
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
                  child: Text("Shipping Details",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,color: Colors.black38,fontWeight: FontWeight.bold ),)),
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
                        Text("Tara Choudhary",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.021 ),),
                      ],
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height*.005,),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("456, Shanti Nagar, Pune, Maharashtra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),)),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("411028, India",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),)),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          Text("Mob Number: ",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.021 ),),
                          SizedBox(width: MediaQuery.of(context).size.width*.03,),
                          Text("+91 9667839945",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020 ),),
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
                  child: Text("Price Details",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,color: Colors.black38,fontWeight: FontWeight.bold ),)),
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
                          Text("Selling price",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,),),
                          Text("₹120",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,),),
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
                          Text("Shipping fee",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,),),
                          Text("Free",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,),),
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
                      Text("Total Amount",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
                      Text("₹120",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024,),),
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
