import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/post/view/widgets/addDetail.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:video_player/video_player.dart';

class VideoGridView extends StatefulWidget {

  const VideoGridView({Key? key}) : super(key: key);
  static const routePath="/videogridview";
  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  List<File>? videoFiles;

  @override
  void initState() {
    super.initState();
    loadVideoFiles();
  }

  Future<void> loadVideoFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      final files = result.files.map((file) => File(file.path.toString())).toList();
      setState(() {
        videoFiles = files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        router.pushReplacement(HomeScreen.routePath);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  EvaIcons.arrowBack,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.height * .04,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .63),
              Builder(
                builder: (context) => InkWell(
                  onTap: () {
                    if (videoFiles != null && videoFiles!.isNotEmpty) {
                      final selectedVideo = videoFiles![0];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoFile: selectedVideo,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.primary,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize:18,
                          color:AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: videoFiles == null
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: videoFiles!.length,
          itemBuilder: (context, index) {
            final videoFile = videoFiles![index];
            final videoController = VideoPlayerController.file(videoFile);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                      videoFile: videoFile,
                    ),
                  ),
                );
              },
              child: VideoThumbnail(videoController: videoController),
            );
          },
        ),
      ),
    );
  }
}

class VideoThumbnail extends StatefulWidget {
  final VideoPlayerController videoController;

  VideoThumbnail({required this.videoController});

  @override
  _VideoThumbnailState createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  @override
  void initState() {
    super.initState();
    initializeVideoController();
  }

  Future<void> initializeVideoController() async {
    await widget.videoController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .03, horizontal: MediaQuery.of(context).size.height * .02),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .7,
                    child: widget.videoController.value.isInitialized
                        ? VideoPlayer(widget.videoController)
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .28,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Edit Video", style: GoogleFonts.plusJakartaSans(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600))),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .28,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Add Clips", style:GoogleFonts.plusJakartaSans(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }
}
