import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/pages/verificationscreen.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController textcontroller=TextEditingController();
  final _formKey= GlobalKey<FormState>();
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
                    child: Image.asset("assets/images/verification.png",height:  MediaQuery.of(context).size.height*.50,width:  MediaQuery.of(context).size.width*.70,)),
              Text("Forgot Password",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.035 ,fontWeight: FontWeight.bold),),
              SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
              Text("Enter your phone number or the",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022 ,color: Colors.blueGrey.withOpacity(.8),wordSpacing: 1.5),),
             Text("email linked to your account",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022 ,color: Colors.blueGrey.withOpacity(.8),wordSpacing: 1.5)),
              SizedBox(height: MediaQuery.of(context).size.height*.025 ,),
              Text("Enter Email",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023 ,color: Colors.black,wordSpacing: 1.5)),
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
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => VerificationScreen(textToShow: textcontroller),
                           ),
                         );
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
