import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/feature/alluser/repo/follow_user_repo.dart';

final followControllerProvider = StateNotifierProvider<FollowController, FollowRepository>((ref) {
  final repository = FollowRepository();
  return FollowController(repository);
});
final unfollowControllerProvider = StateNotifierProvider<UnFollowController, UnFollowRepository>((ref) {
  final repository = UnFollowRepository();
  return UnFollowController(repository);
});

class FollowController extends StateNotifier<FollowRepository> {
  FollowController(this._repository) : super(FollowRepository());

  final FollowRepository _repository;

  Future<void> followUser(String friendId) async {
    try {
      await _repository.followUser(friendId);
       print("Great");
    } catch (error) {
      print('Error following user: $error');
      // Handle error
    }
  }
}


class UnFollowController extends StateNotifier<UnFollowRepository> {
  UnFollowController(this._repository) : super(UnFollowRepository());

  final UnFollowRepository _repository;

  Future<void> unfollowUser(String friendId) async {
    try {
      await _repository.unfollowUser(friendId);
      print("Great");
    } catch (error) {
      print('Error following user: $error');
      // Handle error
    }
  }
}

