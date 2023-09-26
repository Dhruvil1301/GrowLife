import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/plants.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/wishlist.dart';
import 'package:growlife/src/feature/homeview/homescreen.dart';
class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        final exit = await showExitConfirmationDialog(context);
        return exit ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,

          title: Row(
            children: [
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
                  child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
              SizedBox(width:  MediaQuery.of(context).size.height*.032,),
              Text("Shop",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
              SizedBox(width:  MediaQuery.of(context).size.height*.205,),
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
                padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.025,horizontal: MediaQuery.of(context).size.height*.025 ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Product",
                    hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                    prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height*.01)

                  ),
                ),
              ),
              Padding(
                padding:   EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.025,left: MediaQuery.of(context).size.height*.025,right:MediaQuery.of(context).size.height*.025  ),
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                    child: Text("Categories",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.03,fontWeight: FontWeight.bold ),)),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Plants()));
              },
                        child: Image.asset("assets/shop/plants.png",height: MediaQuery.of(context).size.height*.18,width:  MediaQuery.of(context).size.height*.2,)),
                    Image.asset("assets/shop/accessories.png",height:  MediaQuery.of(context).size.height*.18,width:  MediaQuery.of(context).size.height*.2,),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.025,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/shop/fertilizers.png",height: MediaQuery.of(context).size.height*.18,width:  MediaQuery.of(context).size.height*.2,),
                    Image.asset("assets/shop/planters.png",height:  MediaQuery.of(context).size.height*.18,width:  MediaQuery.of(context).size.height*.2,),
                  ],
                ),
              ),
              Padding(
                padding:   EdgeInsets.symmetric( vertical:MediaQuery.of(context).size.height*.025,horizontal: MediaQuery.of(context).size.height*.025 ),
                child: Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Text("Product Lists",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.03,fontWeight: FontWeight.bold ),)),
              ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.024),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                          Stack(
                            children: [
                              Container(
                               alignment:AlignmentDirectional.topStart,
                               child: Container(
                                 width:  MediaQuery.of(context).size.width*.432,
                                 height:  MediaQuery.of(context).size.height*.32,
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
                                 child: Stack(
                                   children: [
                                     Positioned(
                                       top:MediaQuery.of(context).size.height*.018 ,
                                       left: MediaQuery.of(context).size.width*.062 ,
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                               Image.asset("assets/shop/peace_lily.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                            Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Text("Peace Lily",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                                 Row(

                                                   children: [
                                                     Text("₹100",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                         ],
                                       ),
                                     ),
                                     Positioned(
                                       right: 0,
                                       top:MediaQuery.of(context).size.height*.019  ,
                                       child: CircleAvatar(
                                           radius:  MediaQuery.of(context).size.height*.015,
                                           backgroundColor: Colors.blueGrey.withOpacity(.2),
                                           child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                     ),
                                   ],
                                 ),


                               ),
                         ),
                            ],
                          ),
                       Stack(
                         children: [
                           Container(
                             alignment:AlignmentDirectional.topStart,
                             child: Container(
                               width:  MediaQuery.of(context).size.width*.432,
                               height:  MediaQuery.of(context).size.height*.32,
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
                               child: Stack(
                                 children: [
                                   Positioned(
                                     top:MediaQuery.of(context).size.height*.018 ,
                                     left: MediaQuery.of(context).size.width*.062 ,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Image.asset("assets/shop/rubber_plant.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Rubber Plant",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                             Row(

                                               children: [
                                                 Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                       ],
                                     ),
                                   ),
                                   Positioned(
                                     right: 0,
                                     top:MediaQuery.of(context).size.height*.019  ,
                                     child: CircleAvatar(
                                         radius:  MediaQuery.of(context).size.height*.015,
                                         backgroundColor: Colors.blueGrey.withOpacity(.2),
                                         child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                   ),
                                 ],
                               ),


                             ),
                           ),
                         ],
                       ),

                     ],
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       Stack(
                         children: [
                           Container(
                             alignment:AlignmentDirectional.topStart,
                             child: Container(
                               width:  MediaQuery.of(context).size.width*.432,
                               height:  MediaQuery.of(context).size.height*.32,
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
                               child: Stack(
                                 children: [
                                   Positioned(
                                     top:MediaQuery.of(context).size.height*.018 ,
                                     left: MediaQuery.of(context).size.width*.062 ,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Image.asset("assets/shop/watering_can.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Watering Can",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                             Row(

                                               children: [
                                                 Text("₹120",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                       ],
                                     ),
                                   ),
                                   Positioned(
                                     right: 0,
                                     top:MediaQuery.of(context).size.height*.019  ,
                                     child: CircleAvatar(
                                         radius:  MediaQuery.of(context).size.height*.015,
                                         backgroundColor: Colors.blueGrey.withOpacity(.2),
                                         child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                   ),
                                 ],
                               ),


                             ),
                           ),
                         ],
                       ),
                       Stack(
                         children: [
                           Container(
                             alignment:AlignmentDirectional.topStart,
                             child: Container(
                               width:  MediaQuery.of(context).size.width*.432,
                               height:  MediaQuery.of(context).size.height*.32,
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
                               child: Stack(
                                 children: [
                                   Positioned(
                                     top:MediaQuery.of(context).size.height*.018 ,
                                     left: MediaQuery.of(context).size.width*.062 ,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Image.asset("assets/shop/garden_gloves.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Garden Gloves",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                             Row(

                                               children: [
                                                 Text("₹80",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                       ],
                                     ),
                                   ),
                                   Positioned(
                                     right: 0,
                                     top:MediaQuery.of(context).size.height*.019  ,
                                     child: CircleAvatar(
                                         radius:  MediaQuery.of(context).size.height*.015,
                                         backgroundColor: Colors.blueGrey.withOpacity(.2),
                                         child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                   ),
                                 ],
                               ),


                             ),
                           ),
                         ],
                       ),

                     ],
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       Stack(
                         children: [
                           Container(
                             alignment:AlignmentDirectional.topStart,
                             child: Container(
                               width:  MediaQuery.of(context).size.width*.432,
                               height:  MediaQuery.of(context).size.height*.32,
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
                               child: Stack(
                                 children: [
                                   Positioned(
                                     top:MediaQuery.of(context).size.height*.018 ,
                                     left: MediaQuery.of(context).size.width*.062 ,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Image.asset("assets/shop/mud_pot.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Mud Pot",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                             Row(

                                               children: [
                                                 Text("₹130",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                       ],
                                     ),
                                   ),
                                   Positioned(
                                     right: 0,
                                     top:MediaQuery.of(context).size.height*.019  ,
                                     child: CircleAvatar(
                                         radius:  MediaQuery.of(context).size.height*.015,
                                         backgroundColor: Colors.blueGrey.withOpacity(.2),
                                         child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                   ),
                                 ],
                               ),


                             ),
                           ),
                         ],
                       ),
                       Stack(
                         children: [
                           Container(
                             alignment:AlignmentDirectional.topStart,
                             child: Container(
                               width:  MediaQuery.of(context).size.width*.432,
                               height:  MediaQuery.of(context).size.height*.32,
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
                               child: Stack(
                                 children: [
                                   Positioned(
                                     top:MediaQuery.of(context).size.height*.018 ,
                                     left: MediaQuery.of(context).size.width*.062 ,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Image.asset("assets/shop/plastic_pot.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.height*.14,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Plastic Pot",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025),),
                                             Row(

                                               children: [
                                                 Text("₹100",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.024,fontWeight: FontWeight.bold),),
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

                                       ],
                                     ),
                                   ),
                                   Positioned(
                                     right: 0,
                                     top:MediaQuery.of(context).size.height*.019  ,
                                     child: CircleAvatar(
                                         radius:  MediaQuery.of(context).size.height*.015,
                                         backgroundColor: Colors.blueGrey.withOpacity(.2),
                                         child: Icon(Icons.favorite_border,color: Colors.black,size: MediaQuery.of(context).size.height*.02,)),
                                   ),
                                 ],
                               ),


                             ),
                           ),
                         ],
                       ),

                     ],
                   ),
                 ],
               ),
             ),


            ],
          ),
        ),
      ),
    );
  }
  Future showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit", style: GoogleFonts.lato(),),
          content: Text("Are you sure you want to exit the app?",
            style: GoogleFonts.lato(),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(
                    false); // Return false to cancel the exit
              },
              child: Text("No", style: GoogleFonts.lato(),),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: Text("Yes", style: GoogleFonts.lato(),),
            ),
          ],
        );
      },
    );
  }
}
