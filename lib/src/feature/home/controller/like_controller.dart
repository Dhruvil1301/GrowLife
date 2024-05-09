import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/feature/alluser/repo/follow_user_repo.dart';
import 'package:growlife/src/feature/home/repo/like_repo.dart';

final likeControllerProvider = StateNotifierProvider<LikeController, LikeRepository>((ref) {
  final repository = LikeRepository();
  return LikeController(repository);
});


class LikeController extends StateNotifier<LikeRepository> {
  LikeController(this._repository) : super(LikeRepository());

  final LikeRepository _repository;

  Future<void> likeUser(String videoId) async {
    try {
      await _repository.likeUser(videoId);
      print("Great");
    } catch (error) {
      print('Error following user: $error');
      // Handle error
    }
  }
}