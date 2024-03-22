import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/profile/repo/getallvideo_repo.dart';

final videoControllerProvider = StateNotifierProvider<VideoController, AsyncValue<List<Video>>>((ref) {
  final repository = ref.watch(videoRepositoryProvider);
  return VideoController(repository);
});

class VideoController extends StateNotifier<AsyncValue<List<Video>>> {
  final VideoRepository _repository;

  VideoController(this._repository) : super(AsyncValue.loading()) {
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      final videos = await _repository.fetchVideos();
      state = AsyncValue.data(videos);
    } catch (error) {
      throw error;
    }
  }
}
