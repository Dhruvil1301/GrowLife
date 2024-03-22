import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/feature/post/repo/uploadvideo_repo.dart';

class VideoUploadController extends ChangeNotifier {
  bool _isUploading = false;
  bool get isUploading => _isUploading;
  String? _key; // Variable to store user ID

  String? get key => _key;
  static const String videoSave = Api.SaveVideoApi;
  Future<bool> uploadVideo(File file, String title, String description, String uploader) async {
    _isUploading = true;
    notifyListeners();
    try {
      final token = await SharedPreferencesService.getToken();
      if (token != null) {
        final response = await UploadVideoFileRepository.getVideoUploadUrl( title, description, uploader);
        var responseData = json.decode(response.body);
        var uploadUrl = responseData['url'];
        var key=responseData['addVideo']['key'];
        var userid=responseData['_id'];
        if (uploadUrl != null) {

          print(key);
          final response = await http.put(
            Uri.parse(uploadUrl),
            body: await file.readAsBytes(),
          );
          if (response.statusCode == 200) {
            ToastMsg.showToast("Video Uploading....");
            print('Video uploaded successfully.');
            _isUploading = false;
            notifyListeners();

            try {
              final token = await SharedPreferencesService.getToken();
              if (key != null) {
                final headers = {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token',
                };
                final body = json.encode({
                  "key": key
                });
                final response = await http.post(
                  Uri.parse(videoSave),
                  headers: headers,
                  body: body,
                );
                if (response.statusCode == 200) {
                  ToastMsg.showToast("Video Uploaded");
                  print("Video is Saved in DataBase ${response.body}");
                } else {
                  print('Failed to save video: ${response.body}');
                }
              } else {
                throw Exception('Key is null');
              }
            } catch (error) {
              print('Error saving video: $error');
              throw error;
            }
            return true;

          } else {
            ToastMsg.showToast("Failed to upload video");
            print('Failed to upload video: ${response.body}');
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
      print('Error uploading video: $error');
      _isUploading = false;
      notifyListeners();
      return false;
    }
  }
}
