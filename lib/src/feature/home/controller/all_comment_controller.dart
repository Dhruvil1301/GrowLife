
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/all_comment_model.dart';
import 'package:growlife/src/feature/home/repo/all_comment_repo.dart';

class CommentDataController extends StateNotifier<List<Comment>> {
  CommentDataController() : super([]);
  final _repository = CommentDataRepository();
  int _page = 1;
  bool _hasMoreData = true;

  bool get hasMoreData => _hasMoreData;

  Future<void> fetchcommentData(String videoId) async {
    if (!_hasMoreData) return;

    try {
      final commentData = await _repository.commentData(_page, videoId);
      if (commentData.isNotEmpty) {
        state = [...state, ...commentData];
        _page++;
      } else {
        _hasMoreData = false;
      }
    } catch (error) {
      print('Error fetching comment data: $error');
      throw Exception('Failed to fetch comment data: $error');
    }
  }

}
