import 'dart:convert';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FollowRepository {
  static const String followUrl= Api.FollowApi;

  Future<void> followUser(String friendId) async {
    final  token  =   await SharedPreferencesService.getToken();
    final  userId =  await SharedPreferencesServiceUser.getUser();



    final url = Uri.parse(followUrl);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'_id': userId, 'friend_id': friendId});

    try {
      final response = await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
          print("Great Follow request sent");
      } else {
         throw Exception('Failed to follow user: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to follow user: $error');
    }
  }
}
class UnFollowRepository {
static const String followUrl= Api.UnFollowApi;

Future<void> unfollowUser(String friendId) async {
  final  token  =   await SharedPreferencesService.getToken();
  final  userId =  await SharedPreferencesServiceUser.getUser();



  final url = Uri.parse(followUrl);
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  final body = jsonEncode({'_id': userId, 'friend_id': friendId});

  try {
    final response = await http.delete(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print("Removed Your Following");
    } else {
      throw Exception('Failed to follow user: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to follow user: $error');
  }
}
}
