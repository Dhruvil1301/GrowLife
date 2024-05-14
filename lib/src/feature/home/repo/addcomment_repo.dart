import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  static const String addCommentUrl = Api.addCpmmentApi;

  Future<void> addComment(String videoId, String comment,) async {
    final  token  =   await SharedPreferencesService.getToken();
    try {
      final response = await http.post(
        Uri.parse(addCommentUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "videoId": videoId,
          "content": comment,
        }),
      );

      if (response.statusCode == 200) {
        ToastMsg.showToast("Comment Added");
      } else {
        ToastMsg.showToast("Something went wrong!");
        throw Exception('Failed to add comment');
      }
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }
}
