import 'dart:convert';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Models/all_comment_model.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';


class CommentDataRepository {
  Future<List<Comment>> commentData(int page,String videoId) async {
    final token = await SharedPreferencesService.getToken();
    const allComments=Api.allCpmmentApi;

    // Add null checks for token and userId

    final response = await http.post(
      Uri.parse(allComments),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "videoId": videoId,
        "page": page
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> commentData = jsonData["comments"];
      return commentData.map((commentData) => Comment.fromJson(commentData)).toList();
    } else {
      throw Exception('Failed to fetch comment data');
    }
  }
}

