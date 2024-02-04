import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shimmer/shimmer.dart';

class UserVerificationScreen extends StatefulWidget {
  final TextEditingController email;
  UserVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<UserVerificationScreen> createState() => _UserVerificationScreenState();
}

class _UserVerificationScreenState extends State<UserVerificationScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());

  Future<void> VerifyOTP(String otp) async {
    final apiUrl = Uri.parse("https://uptight-shift-crow.cyclic.cloud/Users/v1/api/OtpVerify");
    final Map<String, dynamic> data = {
      "otp": otp,
    };
    final Map<String, String> headers = {
      'Content-Type': 'text/plain', // Assuming 'Content-Type' is 'application/json'

    };
    final String jsonData = json.encode(data);

    // Define the API URL

    try {
      // Send a POST request to the API
      final response = await http.post(
        apiUrl,
        headers: headers,
        body: jsonData
       );

      if (response.statusCode == 200) {
        // Successfully verified OTP
        final String message="Verified";
        showSuccessSnackbar(context,message);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const GoToUserdetails()));
      } else {
        // Handle error
        final jsonResponse = json.decode(response.body);
        final errorMessage = jsonResponse['message'];
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoadingVerfication()));
        showErrorSnackbar(context, errorMessage);
      }
    } catch (e) {
      // Handle network errors
      showErrorSnackbar(context, "Network error: $e");
    }
  }

  void showErrorSnackbar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Optional: You can choose how the snackbar behaves
      duration: const Duration(seconds: 3),
      content: Text(errorMessage,style: GoogleFonts.lato(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(15.sp),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Optional: You can choose how the snackbar behaves
      duration: const Duration(seconds: 3),
      padding: EdgeInsets.all(15.sp),
      content: Text(message,style: GoogleFonts.lato(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                "${widget.email.text}",
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
                   VerifyOTP(otp);
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
                  child: Center(
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
class GoToUserdetails extends StatefulWidget {
  const GoToUserdetails({Key? key}) : super(key: key);

  @override
  State<GoToUserdetails> createState() => _GoToUserdetailsState();
}

class _GoToUserdetailsState extends State<GoToUserdetails> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const UserDetailScreen()));
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
      child: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.1 ),
        child: Shimmer.fromColors(
          baseColor: Colors.blue.withOpacity(.2),
          highlightColor: Colors.blue.withOpacity(.1),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.08 ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
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
class LoadingVerfication extends StatefulWidget {
  const LoadingVerfication({Key? key}) : super(key: key);

  @override
  State<LoadingVerfication> createState() => _LoadingVerficationState();
}


class _LoadingVerficationState extends State<LoadingVerfication> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.1 ),
        child: Shimmer.fromColors(
          baseColor: Colors.blue.withOpacity(.2),
          highlightColor: Colors.blue.withOpacity(.1),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.08 ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
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
