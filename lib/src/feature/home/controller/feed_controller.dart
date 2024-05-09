import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/home/repo/feed_repo.dart';
import 'package:growlife/src/feature/profile/repo/getallvideo_repo.dart';

class FeedDataController extends StateNotifier<List<Feed>> {
  FeedDataController() : super([]);
  final _repository = FeedDataRepository();
  int _page = 1;
  bool _hasMoreData = true;

  bool get hasMoreData => _hasMoreData;

  Future<void> fetchData() async {
    if (!_hasMoreData) return;

    try {
      final feedData = await _repository.fetchVideoData(_page);
      if (feedData.isNotEmpty) {
        state = [...state, ...feedData];
        _page++;
      } else {
        _hasMoreData = false;
      }
    } catch (error) {
      print('Error fetching video data: $error');
    }
  }
}
