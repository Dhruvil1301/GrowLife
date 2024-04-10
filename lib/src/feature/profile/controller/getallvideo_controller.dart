import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/profile/repo/getallvideo_repo.dart';

class VideoDataController extends StateNotifier<List<MyVideo>> {
  VideoDataController() : super([]);
  final _repository = VideoDataRepository();
  int _page = 1;
  bool _hasMoreData = true;

  bool get hasMoreData => _hasMoreData;

  Future<void> fetchData() async {
    if (!_hasMoreData) return;

    try {
      final videoData = await _repository.fetchVideoData(_page);
      if (videoData.isNotEmpty) {
        state = [...state, ...videoData];
        _page++;
      } else {
        _hasMoreData = false;
      }
    } catch (error) {
      print('Error fetching video data: $error');
    }
  }
}
