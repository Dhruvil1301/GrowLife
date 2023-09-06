import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:growlife/Navigationobjects/Home/Home.dart';
import 'package:growlife/Navigationobjects/post/uploadfile.dart';
import 'package:growlife/screen/homescreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller asynchronously.
    _initializeCameraController();
  }

  // Function to initialize the camera controller.
  Future<void> _initializeCameraController() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      // Handle the case where no cameras are available.
      print("No cameras available");
    } else {
      // Use the first camera.
      _controller = CameraController(cameras[0], ResolutionPreset.max);
      _initializeControllerFuture = _controller!.initialize();
      setState(() {}); // Trigger a rebuild when initialization is complete.
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: CameraPreview(_controller!),
                  ),
                  Positioned(
                    left:   MediaQuery.of(context).size.width*.1,
                    top:  MediaQuery.of(context).size.height*.02,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                          },
                            child: Icon(Icons.close,color: Colors.white,size:  MediaQuery.of(context).size.height*.035,)),

                        SizedBox(width:MediaQuery.of(context).size.width*.2 ,),
                        Container(
                            width: MediaQuery.of(context).size.width*.25, // Adjust the size as needed
                            height: MediaQuery.of(context).size.height*.05,
                            decoration: BoxDecoration(
                             color: Colors.black38,
                              borderRadius: BorderRadius.circular(20)

                            ),
                            child: Center(
                              child: Text("00:00",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold,color: Colors.white),)
                            )
                        ),
                        SizedBox(width:MediaQuery.of(context).size.width*.2 ,),
                         Icon(Icons.flash_off_outlined,color: Colors.white,size:  MediaQuery.of(context).size.height*.035),


                      ],
                    ),

                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width*.03,
                      top: MediaQuery.of(context).size.height*.78,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoGridView()));
                            },
                            child: Container(
                              width:  MediaQuery.of(context).size.width*.3,
                              height:  MediaQuery.of(context).size.height*.1,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(EvaIcons.image,color: Colors.white,size:  MediaQuery.of(context).size.height*.035,),
                            ),
                          ),
                          SizedBox( width:  MediaQuery.of(context).size.width*.015),
                          Container(
                            width:  MediaQuery.of(context).size.width*.3, // Adjust the size as needed
                            height:  MediaQuery.of(context).size.height*.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white, // Outer circle color
                                width: 7.0, // Border width
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(12.0),
                              child: Container(
                                width:  MediaQuery.of(context).size.width*.15, // Adjust the size as needed
                                height:  MediaQuery.of(context).size.height*.05,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                ),
                              ),
                            )
                          ),
                          SizedBox( width:  MediaQuery.of(context).size.width*.015),
                          Container(
                            width:  MediaQuery.of(context).size.width*.3,
                            height:  MediaQuery.of(context).size.height*.1,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.flip_camera_ios_outlined,color: Colors.white,size:  MediaQuery.of(context).size.height*.035,),
                          ),

                        ],
                      ),

                  )
                ],
              );
            } else if (snapshot.hasError) {
              // Handle any errors during initialization.
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              // Display a loading indicator while initializing.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
