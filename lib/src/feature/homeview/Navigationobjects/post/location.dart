import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/post/addDetail.dart';
class PostLocation extends StatefulWidget {
  const PostLocation({Key? key}) : super(key: key);

  @override
  State<PostLocation> createState() => _PostLocationState();
}

class _PostLocationState extends State<PostLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.03,vertical: MediaQuery.of(context).size.height*.03),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back,size: MediaQuery.of(context).size.width*.08,color: Colors.black54,)),
                  SizedBox(width: MediaQuery.of(context).size.width*.04 ,),
                  Container(

                    width: MediaQuery.of(context).size.width*.8 ,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: GoogleFonts.lato(),
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.03 ,),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Delhi",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Delhi",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Mumbai",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Maharastra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Bengaluru",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Karnataka",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Kolkata",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("West Bengal",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Pune",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Maharastra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Lucknow",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Uttar Pradesh",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Patna",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Bihar",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Delhi",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Delhi",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Mumbai",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Maharastra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Bengaluru",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Karnataka",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Kolkata",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("West Bengal",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Pune",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Maharastra",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Lucknow",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Uttar Pradesh",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(EvaIcons.pinOutline),
                      title: Text("Patna",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),),
                      subtitle:Text("Bihar",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04, ),) ,
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
