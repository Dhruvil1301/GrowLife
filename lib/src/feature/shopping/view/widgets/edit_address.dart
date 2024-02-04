import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/order/view/widgets/ordersummary.dart';
import 'package:growlife/src/res/assets.dart';

class EditAddress extends StatefulWidget {


  const EditAddress({Key? key}) : super(key: key);
  static const routePath="/editaddress";
  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
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
      appBar:   CommonAppBar(
        title: "Edit Address",
        action: [
          TextButton(onPressed: (){}, child:Text("UPDATE",style: GoogleFonts.plusJakartaSans(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blue),))
        ],
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
                  child: Image.asset(ShopAssets.address,height: MediaQuery.of(context).size.height*.09,width: MediaQuery.of(context).size.width*.08,),
                ),
                Text("Address",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16 ),)
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
                      Text("House no./ Building Name",style: GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
                      Text("Road Name / Area / Colony",style: GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
                      Text("Pincode",style: GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
                            height: MediaQuery.of(context).size.height*.09,
                            width: MediaQuery.of(context).size.width*.32,
                            color: Colors.white,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City",style:GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
                                TextFormField(
                                  controller: cityController,
                                  style: GoogleFonts.lato(),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*.09,
                            width: MediaQuery.of(context).size.width*.35,
                            color: Colors.white,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("State",style:GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
                            hintStyle: GoogleFonts.poppins(),
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
                  child: Image.asset(ShopAssets.phoneicon,height: MediaQuery.of(context).size.height*.09,width: MediaQuery.of(context).size.width*.08,),
                ),
                Text("Contact Detail",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16 ),)
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
                      Text("Name",style:GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
                      Text("Contact Number",style: GoogleFonts.poppins(color: Colors.black38,fontSize:  14),),
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
