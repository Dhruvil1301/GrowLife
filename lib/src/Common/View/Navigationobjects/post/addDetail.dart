import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/Navigationobjects/Home/Home.dart';
import 'package:growlife/src/Common/View/Navigationobjects/post/uploadfile.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerScreen extends StatefulWidget {
  final File videoFile;

  VideoPlayerScreen({required this.videoFile});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController addDiscriptionController = TextEditingController();
  int maxLength = 100;
  int addDisLength=5000;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(false)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        leading: IconButton(
          icon: Icon(EvaIcons.arrowBack,color: Colors.black,size: MediaQuery.of(context).size.height*.035 ,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoGridView()));
          },
        ),
        title: Text('Add Details',style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,color: Colors.black ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _controller.value.isInitialized
                        ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 6 / 9,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      ],
                    )
                        : CircularProgressIndicator(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height * 0.02,top: MediaQuery.of(context).size.height * 0.02,left:MediaQuery.of(context).size.height * 0.02  ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          TextFormField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write a Caption",
                                hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.black),
                                counterText:
                                '${_textEditingController.text.length}/$maxLength',
                                counterStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.018)
                            ),
                            style: GoogleFonts.lato(),
                            maxLines: 7,
                            maxLength: maxLength,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a caption.';
                              }
                              if (value.length > maxLength) {
                                return 'Caption is too long.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.001,
                width: double.infinity,
                color: Colors.black54,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.03,vertical:  MediaQuery.of(context).size.height*.015),
                  child: Text("Add Description",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022,color: Colors.black,fontWeight: FontWeight.bold ),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.03,),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black12,
                            width: 2
                        )
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          counterText:
                          '${addDiscriptionController.text.length}/$addDisLength',
                          counterStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.018)



                      ),
                      maxLines: 7,
                      style: GoogleFonts.lato(),


                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical:MediaQuery.of(context).size.height*.02 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.045),
                    child: Text("Visibility",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.017,color: Colors.black38),),
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.032,),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.55 ),
                        child: Text("Public",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.026,color: Colors.black),),
                      ),

                      Icon(Icons.arrow_forward_ios,color: Colors.black,size: MediaQuery.of(context).size.height*.025,),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.black,size: MediaQuery.of(context).size.height*.032,),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.49 ),
                        child: Text("Location",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.026,color: Colors.black),),
                      ),

                      Icon(Icons.arrow_forward_ios,color: Colors.black,size: MediaQuery.of(context).size.height*.025,),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    children: [
                      Icon(Icons.people,color: Colors.black,size: MediaQuery.of(context).size.height*.032,),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.435),
                        child: Text("Tag People",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.026,color: Colors.black),),
                      ),

                      Icon(Icons.arrow_forward_ios,color: Colors.black,size: MediaQuery.of(context).size.height*.025,),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.045 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          width: MediaQuery.of(context).size.width*.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Text("Save Draft",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023,color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            width: MediaQuery.of(context).size.width*.28,
                            decoration: BoxDecoration(
                              color: Color(0xFF1F588E),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text("Post",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023,color: Colors.white,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
