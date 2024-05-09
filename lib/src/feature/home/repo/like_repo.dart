import 'dart:convert';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeRepository {
  static const String likeUrl= Api.likeApi;

  Future<void> likeUser(String videoId) async {
    final  token  =   await SharedPreferencesService.getToken();
    final  userId =  await SharedPreferencesServiceUser.getUser();



    final url = Uri.parse(likeUrl);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({"videoId": videoId, 'userId': userId});

    try {
      final response = await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Video Liked or Disliked");
      } else {
        throw Exception('Failed to Like or Dislike: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to Like or Dislike: $error');
    }
  }
}