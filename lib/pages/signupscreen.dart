import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/pages/Signin.dart';
import 'package:growlife/pages/welcomescreen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword=false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope (
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body:

            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height:  MediaQuery.of(context).size.height*.01),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset("assets/images/Growlife.png",height:  MediaQuery.of(context).size.height*.05,fit: BoxFit.fill,)),
                          Image.asset("assets/images/GrowLifeText.png",height:MediaQuery.of(context).size.height*.02 ,)
                        ],
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.012),
                    Text('Sign Up',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.035),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.013),
                    Text('Create your new account',style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.024),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.03),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.021,fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093,),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:usernameController ,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.021,fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Username is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller: passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.021),
                            contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller: confirmpasswordController,
                        obscureText: !_showConfirmPassword,
                        decoration: InputDecoration(

                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.021),
                            contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02),
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.025),
                    InkWell(
                      onTap: (){
                            if(_formKey.currentState!.validate()){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

                      }
                      },
                      child: Container(
                        height:  MediaQuery.of(context).size.height*.06,
                        width:   MediaQuery.of(context).size.width*.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFF1F588E),
                              width: 1.0,
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.025),
                          child: Row(

                            children: [
                              Text("SIGN UP",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*.03,),
                              Icon(Icons.arrow_forward,color: Color(0xFF1F588E),size:  MediaQuery.of(context).size.height*.04),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.0015,
                          width:  MediaQuery.of(context).size.width*.16,
                          color: Colors.black,
                        ),
                        SizedBox(width:  MediaQuery.of(context).size.height*.02),
                        Text('or continue with',style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.022),),
                        SizedBox(width: MediaQuery.of(context).size.height*.02),
                        Container(
                          height:  MediaQuery.of(context).size.height*.0015,
                          width:  MediaQuery.of(context).size.width*.16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.016),
                    Container(
                      height:  MediaQuery.of(context).size.height*.05,
                      width:   MediaQuery.of(context).size.width*.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03 ),
                        child: Row(
                          children: [
                               Image.asset("assets/images/googlelogo.png",height:MediaQuery.of(context).size.height*.03 ,),
                               SizedBox(width:MediaQuery.of(context).size.width*.05  ,),
                               Text("Sign up with Google",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.01),
                    Container(
                      height:  MediaQuery.of(context).size.height*.05,
                      width:   MediaQuery.of(context).size.width*.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03 ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/facebooklogo.png",height:MediaQuery.of(context).size.height*.03 ,),
                            SizedBox(width:MediaQuery.of(context).size.width*.05  ,),
                            Text("Sign up with Facebook",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.01),
                    Container(
                      height:  MediaQuery.of(context).size.height*.05,
                      width:   MediaQuery.of(context).size.width*.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03 ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/applelogo.png",height:MediaQuery.of(context).size.height*.03 ,),
                            SizedBox(width:MediaQuery.of(context).size.width*.05  ,),
                            Text("Sign up with Apple",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022),),
                        TextButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

                        }, child: Text("Sign in",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022)))
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
