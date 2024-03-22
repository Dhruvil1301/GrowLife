
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/profile/controller/getallvideo_controller.dart';
import 'package:growlife/src/res/color.dart';
import 'package:video_player/video_player.dart';

class VideoListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This provider will help to trigger the refresh action

    return RefreshIndicator(
      // onRefresh callback triggers when the user pulls down the list to refresh
      onRefresh: () async {
        // Trigger your refresh action here, for example:
        ref.refresh(videoControllerProvider); // Refresh the video list
      },
      child: Container(
        child: ref.watch(videoControllerProvider).when(
          loading: () => const Center(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: LinearProgressIndicator(),
          )),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (videos) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(), // Allow scrolling
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return ListTile(
                  title: Text(video.title),
                  subtitle: Text(video.description),
                  onTap: () {
                    // Play the video when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          videoUrl: video.videoUrl,
                          title: video.title,
                          description: video.description,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String description;


  const VideoPlayerScreen({Key? key, required this.videoUrl, required this.title, required this.description,}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Videos",
      ),
      body: _controller.value.isInitialized
          ? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 6/9,
                  child: VideoPlayer(_controller),
                ),
              ),
              Positioned(

                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColor.greenColor,
                        shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.white,size: 25,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Text(widget.title,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(widget.description,style: GoogleFonts.poppins(),),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),

    );
  }
}