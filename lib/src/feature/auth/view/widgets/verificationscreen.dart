import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:http/http.dart' as http;

class VerificationScreen extends ConsumerStatefulWidget {
  final String textToShow;
  VerificationScreen({Key? key, required this.textToShow}) : super(key: key);

  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());
  final _formKey= GlobalKey<FormState>();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
   bool isLoading=false;




  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otp = _controllers.map((controller) => controller.text).join();
    final otpProvider=ref.read(forgotVerificationProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(ImageAssets.verification,
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .60),
                  ),
                ),
                Text(
                  "Create New Password",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .015),
                Text(
                  "Enter the OTP sent to ",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.blueGrey.withOpacity(.8),
                      wordSpacing: 1.5),
                ),
                Text(
                  "${widget.textToShow}",
                  style: GoogleFonts.poppins(
                      fontSize:16,
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
                        decoration: const InputDecoration(
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
                        style: GoogleFonts.poppins(
                          fontSize:15,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            // Implement resend OTP functionality here
                          },
                          child: Text(
                            "RESEND OTP",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFF185740),
                            ),
                          ))
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*.04),
                InkWell(
                  onTap: (){
                    setState(() {
                      isLoading=true;
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                    if(_formKey.currentState!.validate()){
                   otpProvider.otpVerification(context, widget.textToShow, otp);
                    }
                  },
                  child: Container(
                    height:MediaQuery.of(context).size.height*.06,
                    width: MediaQuery.of(context).size.width*.45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5ED6EA),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Center(child: isLoading==true?CircularProgressIndicator(color: Colors.black,):Text("Verify",style: GoogleFonts.plusJakartaSans(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
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