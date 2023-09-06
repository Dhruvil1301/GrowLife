import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/feedback.dart';
import 'package:growlife/Navigationobjects/shop/wishlist.dart';
import 'package:growlife/screen/homescreen.dart';
import 'package:growlife/Navigationobjects/shop/orderdetail.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.032,),
            Text("My Order",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
            SizedBox(width:  MediaQuery.of(context).size.height*.143,),
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
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: Column(

                children: [
                     SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                     TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                        prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),

                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/shop/fiddleleaf.png",height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                        SizedBox(width:  MediaQuery.of(context).size.width*.03,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delivered on Jun 29 , 2023",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                            SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                            Row(
                              children: [
                                Text("Fiddle leaf fig",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black38 ),),
                                SizedBox(width:  MediaQuery.of(context).size.width*.27,),
                                Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.021,)
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                            Text("Order No. 20060230",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.021, ),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
                  Container(
                    height:MediaQuery.of(context).size.height*.0005 ,
                    width: MediaQuery.of(context).size.width*1,
                    color: Colors.black38,
                  )
                ],
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
              color: Colors.black38,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: Column(

                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/shop/garden_gloves.png",height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                      SizedBox(width:  MediaQuery.of(context).size.width*.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivered on May 07 , 2023",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                          Row(
                            children: [
                              Text("Garden Gloves",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black38 ),),
                              SizedBox(width:  MediaQuery.of(context).size.width*.27,),
                              Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.021,)
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                          Text("Order No. 20060231",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.021, ),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
                  Container(
                    height:MediaQuery.of(context).size.height*.0005 ,
                    width: MediaQuery.of(context).size.width*1,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("ADD FEEDBACK",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021,color: Color(0xFF1F588E) ),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: Column(

                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/shop/fiddleleaf.png",height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                      SizedBox(width:  MediaQuery.of(context).size.width*.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivered on Jun 29 , 2023",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                          Row(
                            children: [
                              Text("Fiddle leaf fig",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black38 ),),
                              SizedBox(width:  MediaQuery.of(context).size.width*.27,),
                              Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.021,)
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                          Text("Order No. 20060230",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.021, ),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
                  Container(
                    height:MediaQuery.of(context).size.height*.0005 ,
                    width: MediaQuery.of(context).size.width*1,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("ADD FEEDBACK",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021,color: Color(0xFF1F588E) ),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01 ,),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
            Container(
              height:MediaQuery.of(context).size.height*.03 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black12,
              child: Center(child: Text("No More Order",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.017,color: Colors.black26 ),)),
            ),

          ],
        ),
      ),
    );
  }
}
