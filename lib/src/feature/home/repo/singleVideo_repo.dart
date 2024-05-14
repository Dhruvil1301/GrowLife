import 'dart:convert';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SingleVideoRepository {
  static const String singleVideoUrl= Api.singleVideoApi;
  Future<ApiResponse> fetchVideo(String videoId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';
    String token = prefs.getString('token') ?? '';

    final response = await http.post(
      Uri.parse(singleVideoUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          "userId": userId,
          "videoId": videoId
        }));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return ApiResponse.fromJson(data);
    } else {
      throw Exception('Failed to load video');
    }
  }
}
