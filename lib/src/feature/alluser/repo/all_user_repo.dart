import 'dart:convert';
import 'package:growlife/src/Models/all_user_model.dart';
import 'package:growlife/src/feature/alluser/controller/all_user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';

class AllUserDataRepository {
  Future<List<AllUserData>> fetchUserData(int page) async {
    final token = await SharedPreferencesService.getToken();
    final response = await http.get(
      Uri.parse('https://growlife-whel.onrender.com/api/v1/user/get-all-users/$page'),
      headers: {'Authorization': 'Bearer $token'}, // Include token in the header
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> usersData = jsonData['users'];
      return usersData.map((userData) => AllUserData.fromJson(userData)).toList();
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}
