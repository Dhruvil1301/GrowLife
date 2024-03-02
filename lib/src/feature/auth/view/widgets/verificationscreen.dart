import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:http/http.dart' as http;

class VerificationScreen extends StatefulWidget {
  final TextEditingController textToShow;
  VerificationScreen({Key? key, required this.textToShow}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());
  final _formKey= GlobalKey<FormState>();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword=false;




  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otp = _controllers.map((controller) => controller.text).join();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(ImageAssets.verification,
                      height: MediaQuery.of(context).size.height * .35,
                      width: MediaQuery.of(context).size.width * .60),
                ),
                Text(
                  "Create New Password",
                  style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.height * .035,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .015),
                Text(
                  "Enter the OTP sent to ",
                  style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.height * .022,
                      color: Colors.blueGrey.withOpacity(.8),
                      wordSpacing: 1.5),
                ),
                Text(
                  "${widget.textToShow.text}",
                  style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.height * .022,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.height * 0.030,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.015),
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            fontSize: MediaQuery.of(context).size.height * 0.03),
                        decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .010),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .12),
                  child: Row(
                    children: [
                      Text(
                        "Did't you recieve the OTP ? ",
                        style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.height * .018,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            // Implement resend OTP functionality here
                          },
                          child: Text(
                            "RESEND OTP",
                            style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.height * .018,
                              color: Color(0xFF185740),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 35.w),
                  child: TextFormField(
                    style: GoogleFonts.lato(),
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                        hintText: 'Enter New Password',
                        hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  16.sp),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                        )
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your password";
                      }
                      if(value.length<6){
                        return "Atleast 6 digit password";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.02 ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  35.w),
                  child: TextFormField(
                    style: GoogleFonts.lato(),
                    controller: confirmpasswordController,
                    obscureText: !_showConfirmPassword,
                    decoration: InputDecoration(

                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  16.sp),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        suffixIcon: IconButton(
                          icon: Icon(_showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                        )
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your password";
                      }
                      else if(value!=passwordController.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.04),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){

                    }
                  },
                  child: Container(
                    height:MediaQuery.of(context).size.height*.06,
                    width: MediaQuery.of(context).size.width*.45,
                    decoration: BoxDecoration(
                      color: Color(0xFF5ED6EA),
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
                    child: Center(child: Text("Continue",style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.03),)),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}