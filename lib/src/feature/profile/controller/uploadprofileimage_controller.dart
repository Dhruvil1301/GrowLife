import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:growlife/src/feature/profile/repo/uploadprofileimage_repo.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';

class ImageUploadController extends ChangeNotifier {
  bool _isUploading = false;
  bool get isUploading => _isUploading;

  Future<bool> uploadImage(File file) async {
    _isUploading = true;
    notifyListeners();

    try {
      final token = await SharedPreferencesService.getToken();

      if (token != null) {
        final uploadUrl = await UploadFileRepository.getUploadUrl(token);
        if (uploadUrl != null) {
          final response = await http.put(
            Uri.parse(uploadUrl),
            body: await file.readAsBytes(),
          );
          if (response.statusCode == 200) {
            print('Image uploaded successfully.');
            _isUploading = false;
            notifyListeners();
            return true;
          } else {
            print('Failed to upload image: ${response.body}');
            _isUploading = false;
            notifyListeners();
            return false;
          }
        } else {
          print('Upload URL not available.');
          _isUploading = false;
          notifyListeners();
          return false;
        }
      } else {
        print('Token not available.');
        _isUploading = false;
        notifyListeners();
        return false;
      }
    } catch (error) {
      print('Error uploading image: $error');
      _isUploading = false;
      notifyListeners();
      return false;
    }
  }

}
