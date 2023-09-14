import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/pages/Signin.dart';
class VerificationScreen extends StatefulWidget {
  final TextEditingController textToShow;
   VerificationScreen({Key? key, required this.textToShow}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/verification.png",height:  MediaQuery.of(context).size.height*.50,width:  MediaQuery.of(context).size.width*.70,)),
            Text("OTP Verification",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.035 ,fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
            Text("Enter the OTP sent to ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022 ,color: Colors.blueGrey.withOpacity(.8),wordSpacing: 1.5),),
            Text("${widget.textToShow.text}",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022 ,color: Colors.black, fontWeight:FontWeight.bold,wordSpacing: 1.5)),
            SizedBox(height: MediaQuery.of(context).size.height*.025 ,),
            SizedBox(height: MediaQuery.of(context).size.height*.010 ,),
            OtpTextField(),
            SizedBox(height: MediaQuery.of(context).size.height*.030 ,),
            Padding(
              padding: EdgeInsets.only(left:MediaQuery.of(context).size.height*.070 ) ,
              child: Row(
                children: [
                  Text("Did't you recieve the OTP ? ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ,color: Colors.black,),),
                  TextButton(onPressed: (){}, child: Text("RESEND OTP",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ,color: Color(0xFF185740),)))
                ],
              ),
            ),
            SizedBox( height:MediaQuery.of(context).size.height*.03),
            InkWell(
              onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
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
                child: Center(child: Text("Verify",style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.03),)),
              ),
            )
          ],
        ),
      ),
    ),);
  }
}

class OtpTextField extends StatefulWidget {
  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width:  MediaQuery.of(context).size.height*.060,
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.03,),
            decoration: InputDecoration(
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            },
          ),
        );
      }),
    );
  }
}
