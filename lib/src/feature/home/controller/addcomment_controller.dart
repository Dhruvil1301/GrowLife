import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/feature/home/repo/addcomment_repo.dart';


class CommentController extends ChangeNotifier {
  final CommentRepository _repository = CommentRepository();

  Future<void> addComment(String videoId, String comment,) async {
    try {
      await _repository.addComment(videoId, comment,);

    } catch (e) {
      // Handle error
      print('Error adding comment: $e');
    }
  }
}
final commentControllerProvider = ChangeNotifierProvider<CommentController>((ref) {
  return CommentController();
});