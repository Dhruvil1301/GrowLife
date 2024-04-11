import 'dart:convert';
import 'package:growlife/src/Models/all_user_model.dart';
import 'package:growlife/src/Models/video_model.dart';
import 'package:growlife/src/feature/alluser/controller/all_user_controller.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';


class VideoDataRepository {
  Future<List<MyVideo>> fetchVideoData(int page) async {
    final token = await SharedPreferencesService.getToken();
    final userId = await SharedPreferencesServiceUser.getUser();
    const myAllVideo=Api.GetMyAllVideos;

    // Add null checks for token and userId
    if (token == null || userId == null) {
      throw Exception('Token or user ID is null');
    }

    final response = await http.post(
      Uri.parse(myAllVideo),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        '_id': userId,
        'page': page
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> videosData = jsonData['allVideo'];
      return videosData.map((videoData) => MyVideo.fromJson(videoData)).toList();
    } else {
      throw Exception('Failed to fetch video data');
    }
  }
}

