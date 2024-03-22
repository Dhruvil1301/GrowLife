import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:http/http.dart' as http;
final videoRepositoryProvider = Provider((ref) {
  final authController = ref.read(signInControllerProvider);
  final userId = authController.userId;
  final apiUrl = 'https://growlife-whel.onrender.com/api/v1/video/getallvideo/$userId';
  return VideoRepository(apiUrl);
});
class VideoRepository {
  final String apiUrl;

  VideoRepository(this.apiUrl);

  Future<List<Video>> fetchVideos() async {
    final token = await SharedPreferencesService.getToken();
    final response = await http.post(Uri.parse(apiUrl),
      headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      },);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['allVideo'];
      return jsonResponse.map((videoJson) => Video.fromJson(videoJson)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
