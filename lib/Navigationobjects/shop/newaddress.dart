import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/ordersummary.dart';
import 'package:growlife/Navigationobjects/shop/product_detail.dart';
class NewAddress extends StatefulWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  TextEditingController buildingController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("New Address",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold),),
            SizedBox(width:  MediaQuery.of(context).size.height*.11,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSummary()));
              },
                child: Text("DONE",style: GoogleFonts.lato(color: Colors.blue,fontSize:  MediaQuery.of(context).size.height*.023,),)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                  child: Image.asset("assets/shop/address.png",height: MediaQuery.of(context).size.height*.09,width: MediaQuery.of(context).size.width*.08,),
                ),
                Text("Address",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.023 ),)
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.05 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("House no./ Building Name",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: buildingController,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Road Name / Area / Colony",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: areaController,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pincode",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: pincodeController,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*.08,
                            width: MediaQuery.of(context).size.width*.32,
                            color: Colors.white,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                                TextFormField(
                                  controller: cityController,
                                  style: GoogleFonts.lato(),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*.08,
                            width: MediaQuery.of(context).size.width*.32,
                            color: Colors.white,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("State",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                                TextFormField(
                                  controller: stateController,
                                  style: GoogleFonts.lato(),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: buildingController,
                        decoration: InputDecoration(
                            hintStyle: GoogleFonts.lato(),
                            hintText: "Land Mark (optional)"
                        ),
                      )
                    ],
                  ),



                ],
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*.025,),
            Container(
              height: MediaQuery.of(context).size.height*.006,
              width:  MediaQuery.of(context).size.width*1,
              color: Colors.blueGrey.withOpacity(.3),
            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                  child: Image.asset("assets/shop/phoneicon.png",height: MediaQuery.of(context).size.height*.09,width: MediaQuery.of(context).size.width*.08,),
                ),
                Text("Contact Detail",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.023 ),)
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: nameController,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Number",style: GoogleFonts.lato(color: Colors.black38,fontSize:  MediaQuery.of(context).size.height*.02,),),
                      TextFormField(
                        style: GoogleFonts.lato(),
                        controller: phoneController,
                      )
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
