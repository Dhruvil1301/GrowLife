import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/View/Navigationobjects/shop/product_detail.dart';
import 'package:growlife/src/Common/View/Navigationobjects/shop/shopping.dart';
import 'package:growlife/src/Common/View/Navigationobjects/shop/wishlist.dart';
import 'package:provider/provider.dart';
class Plants extends StatefulWidget {
  const Plants({Key? key}) : super(key: key);

  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  List<ShopItem> wishlistItems = [];
  bool isFavorite1 = false;
  bool isFavorite2 = false;
  bool isFavorite3 = false;
  bool isFavorite4 = false;
  bool isFavorite5 = false;
  bool isFavorite6 = false;
  bool isFavorite7 = false;
  bool isFavorite8 = false;
  bool isFavorite9 = false;
  bool isFavorite10 = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopping()));
      },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.032,),
            Text("Plants",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
            SizedBox(width:  MediaQuery.of(context).size.height*.1905,),
            InkWell(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistPage()));
            },
                child: Icon(Icons.favorite_border,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)
            ),
            SizedBox(width:  MediaQuery.of(context).size.height*.015,),
            Icon(Icons.shopping_cart_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.025,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Product",
                  hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                  prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),

                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.024),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                           Container(
                            alignment:AlignmentDirectional.topStart,
                            child: Container(
                              width:  MediaQuery.of(context).size.height*.20,
                              height:  MediaQuery.of(context).size.height*.33,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),],

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.001,top :MediaQuery.of(context).size.height*.02 ),
                                        child: Image.asset("assets/shop/peace_lily.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ShopItem newItem = ShopItem(
                                            name: "Peace Lily",
                                            price: "₹100",
                                            imagePath: "assets/shop/peace_lily.png",
                                          );
                                          Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                          setState(() {
                                            isFavorite1 = !isFavorite1;
                                          });

                                        },

                                     child: Padding(
                                        padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                        child: CircleAvatar(
                                            radius: MediaQuery.of(context).size.height*.015,
                                            backgroundColor: Colors.blueGrey.withOpacity(.2),
                                            child: Icon(isFavorite1?Icons.favorite:Icons.favorite_border,color:isFavorite1? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                      ),
                                      )
                                    ],
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Peace Lily",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                        Row(
                                          children: [
                                            Text("₹100",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                            SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                            Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                          ],
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                        Container(
                                          width: MediaQuery.of(context).size.height*.15,
                                          height: MediaQuery.of(context).size.height*.04,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Color(0xFF327E47),
                                              width: 1.0,),
                                          ),
                                          child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ),
                        ),

                      Container(
                        alignment:AlignmentDirectional.topStart,
                        child: Container(
                          width:  MediaQuery.of(context).size.height*.20,
                          height:  MediaQuery.of(context).size.height*.33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.005,top :MediaQuery.of(context).size.height*.02 ),
                                    child: Image.asset("assets/shop/rubber_plant.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopItem newItem = ShopItem(
                                        name: "Rubber Plant",
                                        price: "₹120",
                                        imagePath: "assets/shop/rubber_plant.png",
                                      );
                                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                      setState(() {
                                        isFavorite2 = !isFavorite2;
                                      });

                                    },



                                    child:  Padding(
                                    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                    child: CircleAvatar(
                                        radius:  MediaQuery.of(context).size.height*.015,
                                        backgroundColor: Colors.blueGrey.withOpacity(.2),
                                        child: Icon(isFavorite2?Icons.favorite:Icons.favorite_border,color:isFavorite2? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                  ),
                                  ),
                                ],
                              ),


                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rubber Plant",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                    Row(
                                      children: [
                                        Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                        SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                        Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.height*.15,
                                        height: MediaQuery.of(context).size.height*.04,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF327E47),
                                            width: 1.0,),
                                        ),
                                        child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                          alignment:AlignmentDirectional.topStart,
                          child: Container(
                            width:  MediaQuery.of(context).size.height*.20,
                            height:  MediaQuery.of(context).size.height*.33,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.001,top :MediaQuery.of(context).size.height*.02 ),
                                      child: Image.asset("assets/shop/fiddle_leaf.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        ShopItem newItem = ShopItem(
                                          name: "Fiddle Leaf",
                                          price: "₹120",
                                          imagePath: "assets/shop/fiddle_leaf.png",
                                        );
                                        Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                        setState(() {
                                          isFavorite3 = !isFavorite3;
                                        });

                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                        child: CircleAvatar(
                                            radius: MediaQuery.of(context).size.height*.015,
                                            backgroundColor: Colors.blueGrey.withOpacity(.2),
                                            child: Icon(isFavorite3?Icons.favorite:Icons.favorite_border,color:isFavorite3? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                      ),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Fiddle Leaf",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                      Row(
                                        children: [
                                          Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                          SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                          Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                        ],
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                      Container(
                                        width: MediaQuery.of(context).size.height*.15,
                                        height: MediaQuery.of(context).size.height*.04,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF327E47),
                                            width: 1.0,),
                                        ),
                                        child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ),
                        ),
                      Container(
                        alignment:AlignmentDirectional.topStart,
                        child: Container(
                          width:  MediaQuery.of(context).size.height*.20,
                          height:  MediaQuery.of(context).size.height*.33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.005,top :MediaQuery.of(context).size.height*.02 ),
                                    child: Image.asset("assets/shop/succulent.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopItem newItem = ShopItem(
                                        name: "Succulent",
                                        price: "₹80",
                                        imagePath: "assets/shop/succulent.png",
                                      );
                                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                      setState(() {
                                        isFavorite4 = !isFavorite4;
                                      });

                                    },


                                    child:Padding(
                                    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                    child: CircleAvatar(
                                        radius:  MediaQuery.of(context).size.height*.015,
                                        backgroundColor: Colors.blueGrey.withOpacity(.2),
                                        child:  Icon(isFavorite4?Icons.favorite:Icons.favorite_border,color:isFavorite4? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                  ),)
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Succulent",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                    Row(
                                      children: [
                                        Text("₹80",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                        SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                        Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    Container(
                                      width: MediaQuery.of(context).size.height*.15,
                                      height: MediaQuery.of(context).size.height*.04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF327E47),
                                          width: 1.0,),
                                      ),
                                      child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                          alignment:AlignmentDirectional.topStart,
                          child: Container(
                            width:  MediaQuery.of(context).size.height*.20,
                            height:  MediaQuery.of(context).size.height*.33,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.001,top :MediaQuery.of(context).size.height*.02 ),
                                      child: Image.asset("assets/shop/Pothos.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ShopItem newItem = ShopItem(
                                          name: "Pothos",
                                          price: "₹130",
                                          imagePath: "assets/shop/Pothos.png",
                                        );
                                        Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                        setState(() {
                                          isFavorite5 = !isFavorite5;
                                        });

                                      },



                                   child: Padding(
                                      padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                      child: CircleAvatar(
                                          radius: MediaQuery.of(context).size.height*.015,
                                          backgroundColor: Colors.blueGrey.withOpacity(.2),
                                          child:Icon(isFavorite5?Icons.favorite:Icons.favorite_border,color:isFavorite5? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                    ),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Pothos",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                      Row(
                                        children: [
                                          Text("₹130",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                          SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                          Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                        ],
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                      Container(
                                        width: MediaQuery.of(context).size.height*.15,
                                        height: MediaQuery.of(context).size.height*.04,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF327E47),
                                            width: 1.0,),
                                        ),
                                        child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ),
                        ),

                      Container(
                        alignment:AlignmentDirectional.topStart,
                        child: Container(
                          width:  MediaQuery.of(context).size.height*.20,
                          height:  MediaQuery.of(context).size.height*.33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.005,top :MediaQuery.of(context).size.height*.02 ),
                                    child: Image.asset("assets/shop/monstera.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopItem newItem = ShopItem(
                                        name: "Monstera",
                                        price: "₹100",
                                        imagePath: "assets/shop/monstera.png",
                                      );
                                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                      setState(() {
                                        isFavorite6 = !isFavorite6;
                                      });

                                    },

                                     child:  Padding(
                                    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                    child: CircleAvatar(
                                        radius:  MediaQuery.of(context).size.height*.015,
                                        backgroundColor: Colors.blueGrey.withOpacity(.2),
                                        child: Icon(isFavorite6?Icons.favorite:Icons.favorite_border,color:isFavorite6? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                  ),
                                  )
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Monstera",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                    Row(
                                      children: [
                                        Text("₹100",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                        SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                        Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    Container(
                                      width: MediaQuery.of(context).size.height*.15,
                                      height: MediaQuery.of(context).size.height*.04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF327E47),
                                          width: 1.0,),
                                      ),
                                      child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment:AlignmentDirectional.topStart,
                          child: Container(
                            width:  MediaQuery.of(context).size.height*.20,
                            height:  MediaQuery.of(context).size.height*.33,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.001,top :MediaQuery.of(context).size.height*.02 ),
                                      child: Image.asset("assets/shop/fiddle_leaf.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ShopItem newItem = ShopItem(
                                          name: "Fiddle Leaf",
                                          price: "₹120",
                                          imagePath: "assets/shop/fiddle_leaf.png",
                                        );
                                        Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                        setState(() {
                                          isFavorite7 = !isFavorite7;
                                        });

                                      },


                                  child:  Padding(
                                      padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                      child: CircleAvatar(
                                          radius: MediaQuery.of(context).size.height*.015,
                                          backgroundColor: Colors.blueGrey.withOpacity(.2),
                                          child:Icon(isFavorite7?Icons.favorite:Icons.favorite_border,color:isFavorite7? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                    ),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Fiddle Leaf",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                      Row(
                                        children: [
                                          Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                          SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                          Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                        ],
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                      Container(
                                        width: MediaQuery.of(context).size.height*.15,
                                        height: MediaQuery.of(context).size.height*.04,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF327E47),
                                            width: 1.0,),
                                        ),
                                        child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ),
                        ),
                      Container(
                        alignment:AlignmentDirectional.topStart,
                        child: Container(
                          width:  MediaQuery.of(context).size.height*.20,
                          height:  MediaQuery.of(context).size.height*.33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.005,top :MediaQuery.of(context).size.height*.02 ),
                                    child: Image.asset("assets/shop/succulent.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopItem newItem = ShopItem(
                                        name: "Succulent",
                                        price: "₹80",
                                        imagePath: "assets/shop/succulent.png",
                                      );
                                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                      setState(() {
                                        isFavorite8 = !isFavorite8;
                                      });

                                    },

                                   child: Padding(
                                    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                    child: CircleAvatar(
                                        radius:  MediaQuery.of(context).size.height*.015,
                                        backgroundColor: Colors.blueGrey.withOpacity(.2),
                                        child: Icon(isFavorite8?Icons.favorite:Icons.favorite_border,color:isFavorite8? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                  ),
                                  )
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Succulent",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),

                                    Row(
                                      children: [
                                        Text("₹80",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                        SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                        Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    Container(
                                      width: MediaQuery.of(context).size.height*.15,
                                      height: MediaQuery.of(context).size.height*.04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF327E47),
                                          width: 1.0,),
                                      ),
                                      child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment:AlignmentDirectional.topStart,
                          child: Container(
                            width:  MediaQuery.of(context).size.height*.20,
                            height:  MediaQuery.of(context).size.height*.33,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.001,top :MediaQuery.of(context).size.height*.02 ),
                                      child: Image.asset("assets/shop/peace_lily.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ShopItem newItem = ShopItem(
                                          name: "Peace Lily",
                                          price: "₹100",
                                          imagePath: "assets/shop/peace_lily.png",
                                        );
                                        Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                        setState(() {
                                          isFavorite9 = !isFavorite9;
                                        });

                                      },
                                      child:  Padding(
                                      padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                      child: CircleAvatar(
                                          radius: MediaQuery.of(context).size.height*.015,
                                          backgroundColor: Colors.blueGrey.withOpacity(.2),
                                          child:Icon(isFavorite9?Icons.favorite:Icons.favorite_border,color:isFavorite9? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                    ),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Peace Lily",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                      Row(
                                        children: [
                                          Text("₹100",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                          SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                          Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                        ],
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                      Container(
                                        width: MediaQuery.of(context).size.height*.15,
                                        height: MediaQuery.of(context).size.height*.04,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF327E47),
                                            width: 1.0,),
                                        ),
                                        child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ),
                        ),

                      Container(
                        alignment:AlignmentDirectional.topStart,
                        child: Container(
                          width:  MediaQuery.of(context).size.height*.20,
                          height:  MediaQuery.of(context).size.height*.33,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.022,right:MediaQuery.of(context).size.height*.005,top :MediaQuery.of(context).size.height*.02 ),
                                    child: Image.asset("assets/shop/rubber_plant.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopItem newItem = ShopItem(
                                        name: "Rubber Plant",
                                        price: "₹120",
                                        imagePath: "assets/shop/rubber_plant.png",
                                      );
                                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(newItem);
                                      setState(() {
                                        isFavorite10= !isFavorite10;
                                      });

                                    },

                                    child:Padding(
                                    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.11 ),
                                    child: CircleAvatar(
                                        radius:  MediaQuery.of(context).size.height*.015,
                                        backgroundColor: Colors.blueGrey.withOpacity(.2),
                                        child:  Icon(isFavorite10?Icons.favorite:Icons.favorite_border,color:isFavorite10? Colors.red:Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                  )
                                  )
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.025),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rubber Plant",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                    Row(
                                      children: [
                                        Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),),
                                        SizedBox(width: MediaQuery.of(context).size.width*.01 ,),
                                        Text("₹150",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold,color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                    Container(
                                      width: MediaQuery.of(context).size.height*.15,
                                      height: MediaQuery.of(context).size.height*.04,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF327E47),
                                          width: 1.0,),
                                      ),
                                      child: Center(child: Text("Buy  Now",style: GoogleFonts.lato(color:Color(0xFF327E47),fontSize:MediaQuery.of(context).size.height*.025  ),)),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final String price;
  final String imagePath;

  ShopItem({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}
