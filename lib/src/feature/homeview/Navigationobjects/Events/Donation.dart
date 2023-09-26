import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/Events/eventdetails.dart';



import '../shop/paymentmethod.dart';
class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  RadioValue _selectedValue = RadioValue.option1;

  void _handleRadioValueChanged(RadioValue? value) {
    setState(() {
      _selectedValue = value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetails()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Donation",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.03,),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset("assets/events/donation.png",height:MediaQuery.of(context).size.height*.18,width: MediaQuery.of(context).size.width*.6,)),
            SizedBox(height:MediaQuery.of(context).size.height*.03,),
            Container(
              height: MediaQuery.of(context).size.height*.9,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(.5)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.01,vertical:  MediaQuery.of(context).size.height*.01),
                    child: Text("Donation Form",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.028),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Name",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ),
                          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Email",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ),
                          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Donation Amount",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.059,
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.033),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.059,
                              width: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  "\u20B9",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.height * 0.035,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.698,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter Donation Amount',
                                hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.020),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.height * 0.02,
                                  vertical: MediaQuery.of(context).size.height * 0.018,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Payment Method",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                  ),
                  Column(
                    children: [
                      Center(
                        child: RadioListTile<RadioValue>(
                          title:Row(
                            children: [
                              Text("UPI",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02) ),
                              SizedBox(width: MediaQuery.of(context).size.width*.5,),
                              AvatarSlider(),
                            ],
                          ),
                          value: RadioValue.option1,
                          groupValue: _selectedValue,
                          onChanged: _handleRadioValueChanged,

                        ),
                      ),
                      RadioListTile<RadioValue>(
                        title: Row(
                          children: [
                            Text("Debit/Credit/Atm card",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02) ),
                            SizedBox(width: MediaQuery.of(context).size.width*.15,),
                            CircleAvatar(
                                child: Image.asset("assets/shop/debitcard.png")),
                          ],
                        ),
                        value: RadioValue.option2,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Enter Your UPI ID",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'UPI ID',
                          hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.02),
                          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.0415,),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height*.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03),
                          color:  Color(0xFF0FA958),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(child: Text("Donate",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.025,color: Colors.white ),))
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
enum RadioValue { option1, option2, }
