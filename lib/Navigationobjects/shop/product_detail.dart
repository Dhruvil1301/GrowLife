import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/newaddress.dart';
import 'package:growlife/Navigationobjects/shop/ordersummary.dart';
import 'package:growlife/Navigationobjects/shop/plants.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late List<String> Discription = ["The Rubber Plant, native to Southeast Asia, features large, leathery leaves that have a beautiful shine. It can grow up to several feet in height, making it an excellent choice as a statement plant or a focal point in your indoor garden. The Rubber Plant is well-known for its ability to remove toxins from the air, promoting a healthier and fresher living environment."];
  late List<String> AirPurification=["The Rubber Plant removes harmful toxins from the air, promoting cleaner and fresher indoor air quality."];
  late List<String> AestheticallyPleasing=[" With its glossy leaves and vibrant green color, the Rubber Plant adds a touch of natural beauty to any indoor space,"];
  late List<String> LowMaintenance=["The Rubber Plant is relativelyeasy to care for and can thrive in various indoor environments"];
  late List<String> StressReduction=["he presence of plants, including the Rubber Plant, has been shown to reduce stress and create a calming atmosphere."];





  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.selectedIndex,
        onTap: (index) {
          provider.updateIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add to Cart",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,color:Color(0xFF268E15)  ),),
                      Icon(Icons.shopping_cart_outlined,color: Color(0xFF268E15),),

                    ],
                  ),
                )
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAddress()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.42,
                height: MediaQuery.of(context).size.width*.12,
                decoration: BoxDecoration(
                  color: Color(0xFF268E15),
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Buy Now",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,color:Colors.white  ),),
                        Icon(Icons.double_arrow,color: Colors.white,),

                      ],
                    ),
                  )
              ),
            ),),
            label: '',
          ),
        ],
      ),
      appBar:   AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Plants()));
              },
              child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
          SizedBox(width:  MediaQuery.of(context).size.height*.030,),
          Text("Product Detail",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
          SizedBox(width:  MediaQuery.of(context).size.height*.08,),
          Icon(Icons.favorite_border,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,),
          SizedBox(width:  MediaQuery.of(context).size.height*.015,),
          Icon(Icons.shopping_cart_outlined,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)
        ],
      ),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/shop/product_detail.png",height:MediaQuery.of(context).size.height*.4 ,width: MediaQuery.of(context).size.height*.6,),
                Positioned(
                  left: MediaQuery.of(context).size.height*.38,
                  top: MediaQuery.of(context).size.height*.32,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius:MediaQuery.of(context).size.height*.026,
                        child: Image.asset("assets/shop/wishlisticon.png",height:MediaQuery.of(context).size.height*.03,width: MediaQuery.of(context).size.height*.03 ,)),
                  ),
                Positioned(
                  left: MediaQuery.of(context).size.height*.38,
                  top: MediaQuery.of(context).size.height*.25,
                  child:Container(
                    width: MediaQuery.of(context).size.height*.05,
                    height: MediaQuery.of(context).size.height*.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Adjust color to create depth effect
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 1), // Adjust the shadow position
                        ),
                      ],
                    ),child: Icon(Icons.favorite_border,size:  MediaQuery.of(context).size.height*.03,),
                ),
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,top: MediaQuery.of(context).size.height*.02 ),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                  child: Text("Rubber Plant",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.03),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.007,),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("₹120",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.03,fontWeight: FontWeight.bold),)),
            ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
          child: Container(
            alignment: AlignmentDirectional.topStart,
            child: Text("Free Delivery",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold,color: Colors.black45),)),
        ),
         SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
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
            )),
            SizedBox(height: MediaQuery.of(context).size.height*.025,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Description:",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.03,fontWeight: FontWeight.bold,),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.015 ),
              child: Text(Discription.join(""),style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.019 ),),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Benefits of Rubber Plants:",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023,fontWeight: FontWeight.bold,),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Air Purification: ',
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 ),
                    ),
                    TextSpan(text: AirPurification.join(""),style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 )),
                  ],
                ),
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Aesthetically Pleasing ',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 ),
                      ),
                      TextSpan(text: AestheticallyPleasing.join(""),style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 )),
                    ],
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Low Maintenances: ',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 ),
                      ),
                      TextSpan(text: LowMaintenance.join(""),style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 )),
                    ],
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Stress Reduction: ',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 ),
                      ),
                      TextSpan(text: StressReduction.join(""),style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.width*.038 )),
                    ],
                  ),
                )
            ),

            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.030),
              child: Container(
                height:MediaQuery.of(context).size.height*.002 ,
                width: MediaQuery.of(context).size.width*1 ,
                color: Colors.blueGrey.withOpacity(.3),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Related Product",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold,color: Colors.black54),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.013,),
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
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.030),
              child: Container(
                height:MediaQuery.of(context).size.height*.002 ,
                width: MediaQuery.of(context).size.width*1 ,
                color: Colors.blueGrey.withOpacity(.3),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Customer Reviews",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold,color: Colors.black54),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                      child: StarRating()),
                ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Based On 100 Reviews",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.042 ,
                          width: MediaQuery.of(context).size.width*.09 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.030),
                            border: Border.all(
                              width: 2,
                              color: Colors.black
                            )
                          ),
                          child: Icon(Icons.person_outline_outlined,size: MediaQuery.of(context).size.height*.030,)),
                      SizedBox(width: MediaQuery.of(context).size.width*.02 ,),
                      Text("Neha Singh",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold  ),),
                      SizedBox(width: MediaQuery.of(context).size.width*.042 ,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
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
                          )),

                    ],
                  )
            ),




            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05 ),
              child: Text("I loved it...recieved exactly same product as show in the picture.",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020),)
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height*.042 ,
                          width: MediaQuery.of(context).size.width*.09 ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.030),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.black
                              )
                          ),
                          child: Icon(Icons.person_outline_outlined,size: MediaQuery.of(context).size.height*.030,)),
                      SizedBox(width: MediaQuery.of(context).size.width*.02 ,),
                      Text("Neha Singh",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold  ),),
                      SizedBox(width: MediaQuery.of(context).size.width*.042 ,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
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
                          )),

                    ],
                  )
              ),




            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05 ),
              child: Container(
               child:   Text("I loved it...recieved exactly same product as show in the picture.",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020),)
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(

                  child: Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height*.042 ,
                          width: MediaQuery.of(context).size.width*.09 ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.030),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.black
                              )
                          ),
                          child: Icon(Icons.person_outline_outlined,size: MediaQuery.of(context).size.height*.030,)),
                      SizedBox(width: MediaQuery.of(context).size.width*.02 ,),
                      Text("Neha Singh",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold  ),),
                      SizedBox(width: MediaQuery.of(context).size.width*.042 ,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
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
                          )),

                    ],
                  )
              ),




            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05 ),
              child: Container(
                 child: Text("I loved it...recieved exactly same product as show in the picture.",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020),))),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.050 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("View More",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold,color:Color(0xFF1F588E)),)),
            ),





          ],
        ),
      ),
    );

  }
}
class StarRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var starProvider = Provider.of<StarRatingProvider>(context);

    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => starProvider.toggleStar(index),
          child: Icon(
            starProvider.selectedStars[index]
                ? Icons.star
                : Icons.star_border,
            size: MediaQuery.of(context).size.height*.04,
            color: starProvider.selectedStars[index]
                ? Colors.yellow
                : Colors.grey,
          ),
        );
      }),
    );
  }
}
