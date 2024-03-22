import 'dart:convert';
import 'dart:io';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';

class UploadFileRepository {
  static const String uploadUrlApiUrl = Api.GetUrl;

  static Future<String?> getUploadUrl(String token) async {
    try {
      final response = await http.get(
        Uri.parse(uploadUrlApiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final url = responseBody['url'];
        final key=responseBody['key'];
        await SharedPreferencesServiceKeyForProfile.saveKey(key);// Assuming the URL key in the response JSON is 'url'
        print(key);
        return url;
      } else {
        print('Failed to get upload URL: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error getting upload URL: $error');
      return null;
    }
  }

}
