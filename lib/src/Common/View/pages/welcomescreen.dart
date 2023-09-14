import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/pages/notificationscreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(

        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/Welcome.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width*1,height: MediaQuery.of(context).size.height*.3),
                    Text("GROWLIFE",style: GoogleFonts.lato(fontSize: 28,letterSpacing: 6,fontWeight: FontWeight.bold,color: Colors.white),)

                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*.018,),
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/Growlife.png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width*.16),),
                SizedBox(height: MediaQuery.of(context).size.height*.012,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome to ",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width*.08,fontWeight: FontWeight.bold),),
                    Image.asset("assets/images/GrowLifeText.png",height:MediaQuery.of(context).size.height*.03),
                  ],),
                SizedBox(height: MediaQuery.of(context).size.height*.016,),
                Text("Discover the beauty of nature ",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.width*.053,wordSpacing: 1),),
                SizedBox(height: MediaQuery.of(context).size.height*.001,),
                Text(" & contribute to a greener world",style: GoogleFonts.lato (fontSize:  MediaQuery.of(context).size.width*.053,wordSpacing: 1),),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*.07,
                    width: MediaQuery.of(context).size.width*.8,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.02),
                          child: Text("Get Started",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.width*.06),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.02),
                          child: Icon(Icons.arrow_forward,color: Color(0xFF1F588E),size: MediaQuery.of(context).size.height*.04,),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.23,),
                Text("by continuing, you’re accepting our",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width*.043),),
                SizedBox(height:MediaQuery.of(context).size.height*.005 ,),
                Text(" privacy policy & terms of service",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.width*.043,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}