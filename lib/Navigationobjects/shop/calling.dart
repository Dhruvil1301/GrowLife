import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Calling extends StatefulWidget {
  const Calling({Key? key}) : super(key: key);

  @override
  State<Calling> createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCE9F8),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.02,top: MediaQuery.of(context).size.height*.15),
            child: Column(
              children: [
                Image.asset("assets/shop/customdeliveryboy.png",fit: BoxFit.contain,height: MediaQuery.of(context).size.height*.12,width: MediaQuery.of(context).size.width*.3,),
                SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                Text("Viraj Shah",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.03),),
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Text("Connecting......",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022),),
              ],
            ),

          ),
          SizedBox(height:  MediaQuery.of(context).size.height*.2843,),
          Container(
            height:MediaQuery.of(context).size.height*.35 ,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight:Radius.circular(MediaQuery.of(context).size.height*.05),topLeft:Radius.circular(MediaQuery.of(context).size.height*.05)  )
            ),
            child: Column(
              children: [
                SizedBox(height:  MediaQuery.of(context).size.height*.06,),
                Image.asset("assets/shop/callingicon.png",height:MediaQuery.of(context).size.height*.12,width: MediaQuery.of(context).size.width*.6 ,),
                SizedBox(height:  MediaQuery.of(context).size.height*.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.height*.11 ,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(.2)

                      ),
                      child: Icon(Icons.mic_off,size: MediaQuery.of(context).size.height*.035,),
                    ),
                    Container(
                      height:MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.height*.11 ,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.2)

                      ),
                      child: Icon(Icons.videocam_off_outlined,size: MediaQuery.of(context).size.height*.035,),
                    ),
                    Container(
                      height:MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.height*.11 ,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.2)

                      ),
                      child: Icon(Icons.volume_up_outlined,size: MediaQuery.of(context).size.height*.035,),
                    ),
                    Container(
                      height:MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.height*.11 ,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.2)

                      ),
                      child: Icon(Icons.settings,size: MediaQuery.of(context).size.height*.04,),
                    )
                  ],
                )
              ],
            ),
          )
            
          
        ],
      ),
    );
  }
}
