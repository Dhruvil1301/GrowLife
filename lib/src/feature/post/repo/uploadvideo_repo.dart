import 'dart:convert';
import 'dart:io';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';

class UploadVideoFileRepository {
  static const String uploadUrl = Api.GetVideoUrl;

  static Future<http.Response> getVideoUploadUrl( String title, String description, String uploader) async {
    try {
      final token = await SharedPreferencesService.getToken();
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = json.encode({
        'title':title,
        'description':description,
        'uploader':uploader,
        'views':0,
        'likes':0,
        'dislikes':0,
        'tags': [
          ""
        ],
        'comments': [],
        'uploadDate': DateTime.now().toString(),
        'thumbnailUrl':"https://hello.com",
        'isPrivate':false,
      });

      final response = await http.post(
        Uri.parse(uploadUrl),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        print('Failed to get upload URL: ${response.body}');
        return response;
      }
    } catch (error) {
      print('Error getting upload URL: $error');
      throw error;
    }
  }

}
