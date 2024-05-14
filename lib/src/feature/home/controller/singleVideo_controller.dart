import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/home/repo/singleVideo_repo.dart';

// Provider for the repository
final singleVideoRepositoryProvider = Provider<SingleVideoRepository>((ref) {
  return SingleVideoRepository();
});

// Provider for fetching single video
final singleVideoProvider = FutureProvider.autoDispose.family<ApiResponse, String>((ref, videoId) async {
  final _repository = ref.read(singleVideoRepositoryProvider);
  final response = await _repository.fetchVideo(videoId);
  return response;
});

class SingleVideoController {
  // Fetch single video using the provider
  Future<AutoDisposeFutureProvider<ApiResponse>> fetchSingleVideo(String videoId) async {
    try {
      return await singleVideoProvider(videoId);
    } catch (e) {
      print('Error fetching single video: $e');
      throw Exception('Failed to load video');
    }
  }
}
