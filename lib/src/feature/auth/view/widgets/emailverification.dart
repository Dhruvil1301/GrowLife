import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/controller/emailverification_controller.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class EmailVerification extends ConsumerStatefulWidget {
  final String email;
   EmailVerification({Key? key, required this.email}) : super(key: key);

  @override
  ConsumerState<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends ConsumerState<EmailVerification> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());
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
    final emailVerification = ref.read(emailVerificationProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(ImageAssets.verification,
                    height: MediaQuery.of(context).size.height * .450,
                    width: MediaQuery.of(context).size.width * .70),
              ),
              Text(
                "OTP Verification",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Text(
                "Enter the OTP sent to ",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    wordSpacing: 1.5),
              ),
              Text(
                "${widget.email}",
                style: GoogleFonts.poppins(
                    fontSize:16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 1.5),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .025),
              SizedBox(height: MediaQuery.of(context).size.height * .010),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    width: MediaQuery.of(context).size.height * 0.040,
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
              SizedBox(height: MediaQuery.of(context).size.height * .030),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .085),
                child: Row(
                  children: [
                    Text(
                      "Did't you recieve the OTP ? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          // Implement resend OTP functionality here
                        },
                        child: Text(
                          "RESEND OTP",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColor.darkGreenColor,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
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
                 emailVerification.signUpVerification(context, widget.email, otp);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .45,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5ED6EA),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: isLoading==true?const Center(child: CircularProgressIndicator(color: Colors.black,)):Center(
                    child: Text(
                      "Verify",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
