import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/plants.dart';
import 'package:growlife/Navigationobjects/shop/shopping.dart';
import 'package:provider/provider.dart';

import '../../main.dart';


class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    List<ShopItem> wishlistItems = Provider.of<WishlistProvider>(context).wishlistItems;
    TextEditingController _searchController = TextEditingController();

    @override
    void dispose() {
      _searchController.dispose();
      super.dispose();
    }


    return
      Scaffold (
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
              Text("Wishlist",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
              SizedBox(width:  MediaQuery.of(context).size.height*.215,),
              Icon(Icons.shopping_cart_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)
            ],
          ),
        ),
         body:
             Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.025,horizontal: MediaQuery.of(context).size.height*.025 ),
                   child: TextFormField(
                     controller: _searchController,
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
                 Expanded(
                   child: ListView.builder(
                    itemCount: (wishlistItems.length + 1) ~/ 2, // Calculate the number of rows needed
                    itemBuilder: (context, rowIndex) {
                      int firstIndex = rowIndex * 2;
                      int secondIndex = firstIndex + 1;

                      return Row(
                        children: [
                          if (firstIndex < wishlistItems.length)
                            WishlistItemContainer(item: wishlistItems[firstIndex]),
                          if (secondIndex < wishlistItems.length)
                            WishlistItemContainer(item: wishlistItems[secondIndex]),
                        ],
                      );
                    },
    ),
                 ),
               ],
             ),

       );
  }
}

class WishlistItemContainer extends StatefulWidget {
  final ShopItem item;

  WishlistItemContainer({required this.item});

  @override
  State<WishlistItemContainer> createState() => _WishlistItemContainerState();
}

class _WishlistItemContainerState extends State<WishlistItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.20,
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.022,
                            right: MediaQuery.of(context).size.height * 0.001,
                            top: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Image.asset(
                            widget.item.imagePath,
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.height * 0.14,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.11,
                          ),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.015,
                            backgroundColor: Colors.blueGrey.withOpacity(0.2),
                            child: Icon(
                               Icons.favorite_outlined, // Change favorite icon based on the isFavorite property
                              color:  Colors.red , // Change color based on the isFavorite property
                              size: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.025,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item.name, style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.025)),
                          Text(widget.item.price, style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.bold)),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.15,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFF327E47),
                                width: 1.0,
                              ),
                            ),
                            child: Center(child: Text("Buy Now", style: GoogleFonts.lato(color: Color(0xFF327E47), fontSize: MediaQuery.of(context).size.height * 0.025))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


