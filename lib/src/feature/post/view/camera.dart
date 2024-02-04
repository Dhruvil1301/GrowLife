import 'package:camera/camera.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/post/view/widgets/uploadfile.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:video_player/video_player.dart';
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  bool isTorchOn = false;

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
      _initializeControllerFuture = _controller.initialize();
      setState(() {}); // Trigger a rebuild when initialization is complete.
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
      // There is only one camera or no cameras available.
      return;
    }

    // Find the index of the current camera.
    final currentCameraIndex = cameras.indexWhere(
            (camera) => camera.lensDirection == _controller.description.lensDirection);

    // Calculate the index of the next camera.
    final nextCameraIndex =
        (currentCameraIndex + 1) % cameras.length;

    // Dispose of the current controller.
    await _controller.dispose();

    // Initialize the new camera controller with the next camera.
    _controller = CameraController(
      cameras[nextCameraIndex],
      ResolutionPreset.max,
    );

    // Initialize the controller asynchronously.
    _initializeControllerFuture = _controller.initialize();

    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed.
    _controller.dispose();
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
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
                              "00:00",
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
                            // Handle the action when the image icon is tapped.
                            // Replace this with your desired functionality.
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoGridView()));
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
                        Container(
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
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
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
              // Handle any errors during initialization.
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              // Display a loading indicator while initializing.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
