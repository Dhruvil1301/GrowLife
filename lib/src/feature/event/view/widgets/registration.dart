import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/event/view/widgets/eventdetails.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';

class Registration extends StatefulWidget {


  const Registration({Key? key}) : super(key: key);
  static const routePath="/eventregistration";
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CommonAppBar(title: " Event Registration"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset(EventAssets.registration,height:MediaQuery.of(context).size.height*.2,width: MediaQuery.of(context).size.width*.45,)),
            SizedBox(height:MediaQuery.of(context).size.height*.03,),
            Container(
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
                    child: Text("Registration Form",style:GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: Text("Name",style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
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
                    child: Text("Email",style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
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
                    child: Text("Phone Number",style:  GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone no.',
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
                    child: Text("Select Event",style:  GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
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
                          hintText: 'Select event',
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
                    child: Text("Comment",style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
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
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Any special requests or comments......',
                          hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ),
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
                        color:AppColor.primary,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(child: Text("Register",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w700,color: Colors.white ),))
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
