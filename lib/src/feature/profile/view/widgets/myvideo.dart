import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/profile/controller/getallvideo_controller.dart';
import 'package:video_player/video_player.dart';

class VideoListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(videoControllerProvider.notifier).fetchData(); // Call fetch data here

    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(videoControllerProvider);
      },
      child:
       Consumer(
          builder: (context, ref, _) {
            final videos = ref.watch(videoControllerProvider);

            return videos.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: videos.length+1, // Add one for loading indicator
              itemBuilder: (context, index) {
                if (index < videos.length) {
                  final video = videos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoListItem(video: video),
                  );
                } else {
                  if (ref.read(videoControllerProvider.notifier).hasMoreData) {
                    ref.read(videoControllerProvider.notifier).fetchData();
                    return _buildLoadingIndicator();
                  } else {
                    return _buildNoMoreDataIndicator();
                  }
                }
              },
            );
          },
        ),

    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildNoMoreDataIndicator() {
    // Optionally, you can display a message when no more data is available
    return  Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(child: Text("Thank you!! Your Post End here",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 15),)),
    );
  }
}


class VideoListItem extends StatefulWidget {
  final MyVideo video;

  const VideoListItem({Key? key, required this.video}) : super(key: key);

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool play = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return VideoPlayer(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        play = !play;
                      });
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    },
                    icon: Icon(
                      play ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.video.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              Text(
               widget.video.formattedTimeDifference,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
