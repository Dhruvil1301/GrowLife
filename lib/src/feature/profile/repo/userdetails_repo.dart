import 'dart:convert';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;

class UserUpdateRepository {
  static const String fetchUserApiUrl = Api.GetProfile;
  static const String updateUserApiUrl = Api.UpdateProfile;

  Future<Map<String, dynamic>> fetchUserDetails(String token) async {
    final token = await SharedPreferencesService.getToken();
    final response = await http.get(
        Uri.parse(fetchUserApiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ToastMsg.showToast("Your Informations");
      print("data fetched success");
      return data;
    } else {
      throw Exception('Failed to fetch user details');
    }
  }

  Future<bool> updateUser(String token, String key, String email, Map<String, dynamic> userDetails) async {
    try {
      final key = await SharedPreferencesServiceKeyForProfile.getKey(); // Fetch the key from SharedPreferences
      final response = await http.put(
        Uri.parse(updateUserApiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          ...userDetails, // Include user details
          'key': key,
          'email': email// Include the key fetched from SharedPreferences
        }),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        final profilePic=responseBody['profile']['profilePic'];
        print(profilePic);
        print('User details updated successfully.');

        return true;
      } else {
        ToastMsg.showToast("Failed to Update Please Provide Details");
        print('Failed to update user details: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error updating user details: $error');
      return false;
    }
  }

}
