class Comment {
  final String id;
  final String videoId;
  final CommentUser userId;
  final String content;
  final int likes;
  final List<Comment> replies;
  final String createdAt;

  Comment({
    required this.id,
    required this.videoId,
    required this.userId,
    required this.content,
    required this.likes,
    required this.replies,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      videoId: json['videoId'],
      userId: CommentUser.fromJson(json['userId']), // Assuming you have a User class
      content: json['content'],
      likes: json['likes'],
      replies: (json['replies'] as List<dynamic>).map((replyJson) => Comment.fromJson(replyJson)).toList(),
      createdAt: json['createdAt'],
    );
  }
}


class CommentUser {
  final String id;
  final String username;
  final String profilePic;

  CommentUser({
    required this.id,
    required this.username,
    required this.profilePic,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
      id: json['_id'],
      username: json['username'],
      profilePic: json['profilePic'],
    );
  }
}
