import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/post/view/widgets/uploadfile.dart';
import 'package:growlife/src/utils/route.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  bool isTorchOn = false;
  bool isRecording = false;
  int secondsElapsed = 0; // Tracks the elapsed seconds

  late Timer _timer; // Timer object





  @override
  void initState() {
    super.initState();
    _initializeCameraController();
  }

  Future<void> _initializeCameraController() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      print("No cameras available");
    } else {
      _controller = CameraController(cameras[0], ResolutionPreset.max);
      _initializeControllerFuture = _controller.initialize();
      setState(() {});
    }
  }

  void _toggleTorch() {
    setState(() {
      isTorchOn = !isTorchOn;
    });

    if (isTorchOn) {
      _controller.setFlashMode(FlashMode.torch);
    } else {
      _controller.setFlashMode(FlashMode.off);
    }
  }

  void _toggleCamera() async {
    final cameras = await availableCameras();
    if (cameras.length < 2) {
      return;
    }

    final currentCameraIndex = cameras.indexWhere(
            (camera) => camera.lensDirection == _controller.description.lensDirection);

    final nextCameraIndex = (currentCameraIndex + 1) % cameras.length;

    await _controller.dispose();

    _controller = CameraController(
      cameras[nextCameraIndex],
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();

    setState(() {});
  }

  void _startVideoRecording() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    try {


      await _initializeControllerFuture;
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          secondsElapsed++; // Increment seconds elapsed every second
        });
      });
      await _controller.startVideoRecording(); // Provide the file path
      setState(() {
        isRecording = true;
        secondsElapsed = 0;
      });
    } catch (e) {
      print('Error starting video recording: $e');
    }
  }

  void _stopVideoRecording() async {
    if (!_controller.value.isRecordingVideo) {
      return null;
    }

    try {
      _timer.cancel();
      final XFile videoFile = await _controller.stopVideoRecording();
      File file = File(videoFile.path);

      setState(() {
        isRecording = false;

        });


             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => VideoGridView(videoFile: file,)),
             );




      print(file);
    } catch (e) {
      print('Error stopping video recording: $e');
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            router.pop();
            return true;
          },
          child: Scaffold(
            body: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: CameraPreview(_controller),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.02,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                router.push(HomeScreen.routePath);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.035,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                '${(secondsElapsed ~/ 60).toString().padLeft(2, '0')}:${(secondsElapsed % 60).toString().padLeft(2, '0')}' ,
                                  style: GoogleFonts.lato(
                                    fontSize: MediaQuery.of(context).size.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                            IconButton(
                              icon: Icon(
                                isTorchOn ? Icons.flash_on : Icons.flash_off,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.035,
                              ),
                              onPressed: _toggleTorch,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.78,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoGridView()));
                                print("alright");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Colors.black38,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  EvaIcons.image,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height * 0.035,
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                            InkWell(
                              onTap: isRecording ? _stopVideoRecording : _startVideoRecording,

                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 7.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    decoration: isRecording
                                        ? const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    )
                                        : const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.flip_camera_ios_outlined,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height * 0.035,
                                ),
                                onPressed: _toggleCamera,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
