import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/auth/view/widgets/verificationscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
class ForgotPassword extends StatelessWidget {


  ForgotPassword({Key? key}) : super(key: key);
  static const routePath="/forgotpassword";

  TextEditingController textcontroller=TextEditingController();

  final _formKey= GlobalKey<FormState>();

  final String  success="You want to forget Your password";

  void showSuccessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Optional: You can choose how the snackbar behaves
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(15.sp),
      content: Text(message,style: GoogleFonts.lato(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                Container(
                  alignment: Alignment.center,
                    child: Image.asset(ImageAssets.verification,height:  MediaQuery.of(context).size.height*.50,width:  MediaQuery.of(context).size.width*.70,)),
              Text("Forgot Password",style: GoogleFonts.plusJakartaSans(fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
              Text("Enter your phone number or \nthe email linked to your account",style: GoogleFonts.poppins(fontSize: 16 ,fontWeight: FontWeight.w400,),textAlign:TextAlign.center),
              SizedBox(height: MediaQuery.of(context).size.height*.025 ,),
              Text("Enter Email",style:GoogleFonts.poppins(fontSize: 16 ,fontWeight: FontWeight.w400,)),
              SizedBox(height: MediaQuery.of(context).size.height*.010 ,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.050 ),
                child: TextFormField(
                  controller: textcontroller ,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                ),
              ),
             SizedBox( height:MediaQuery.of(context).size.height*.08),
                   InkWell(
                     onTap: (){
                       if(_formKey.currentState!.validate()){

                       }
                     },
                child: Container(
                  height:MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.45,
                  decoration: BoxDecoration(
                      color:AppColor.blueButtonColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Center(child: Text("Get OTP",style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.03),)),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}

class LoadingForgetPassword extends StatefulWidget {
  const LoadingForgetPassword({Key? key}) : super(key: key);

  @override
  State<LoadingForgetPassword> createState() => _LoadingForgetPasswordState();
}

class _LoadingForgetPasswordState extends State<LoadingForgetPassword> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
        baseColor: Colors.blue.withOpacity(.2),
        highlightColor: Colors.blue.withOpacity(.1),
        child: Center(
          child: Container(
           child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06 ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.02 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoToVerification extends StatefulWidget {
  final TextEditingController text;
  const GoToVerification({Key? key, required this.text}) : super(key: key);

  @override
  State<GoToVerification> createState() => _GoToVerificationState();
}

class _GoToVerificationState extends State<GoToVerification> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerificationScreen(textToShow: widget.text)));
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
        baseColor: Colors.blue.withOpacity(.2),
        highlightColor: Colors.blue.withOpacity(.1),
        child: Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06 ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.07 ,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Container(
                      height: MediaQuery.of(context).size.height*.07 ,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    Container(
                      height: MediaQuery.of(context).size.height*.07 ,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Container(
                      height: MediaQuery.of(context).size.height*.07 ,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    Container(
                      height: MediaQuery.of(context).size.height*.02 ,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

