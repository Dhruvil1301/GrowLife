class MyVideo {
  final String id;
  final String title;
  final String description;
  final int views;
  final List<dynamic> likes;
  final int dislikes;
  final List<String> tags;
  final String thumbnailUrl;
  final bool isPrivate;
  final DateTime createdAt;
  final String videoUrl;
  final int commentsCount;
  final UploaderDetails uploaderDetails;
  final String formattedTimeDifference;

  MyVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.views,
    required this.likes,
    required this.dislikes,
    required this.tags,
    required this.thumbnailUrl,
    required this.isPrivate,
    required this.createdAt,
    required this.videoUrl,
    required this.commentsCount,
    required this.uploaderDetails,
    required this.formattedTimeDifference,
  });

  factory MyVideo.fromJson(Map<String, dynamic> json) {
    return MyVideo(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      views: json['views'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      tags: List<String>.from(json['tags']),
      thumbnailUrl: json['thumbnailUrl'],
      isPrivate: json['isPrivate'],
      createdAt: DateTime.parse(json['createdAt']),
      videoUrl: json['videoUrl'],
      commentsCount: json['commentsCount'],
      uploaderDetails: UploaderDetails.fromJson(json['uploaderDetails']),
      formattedTimeDifference: json['formattedTimeDifference'],
    );
  }
}

class UploaderDetails {
  final String id;
  final String username;
  final String profilePic;

  UploaderDetails({
    required this.id,
    required this.username,
    required this.profilePic,
  });

  factory UploaderDetails.fromJson(Map<String, dynamic> json) {
    return UploaderDetails(
      id: json['_id'],
      username: json['username'],
      profilePic: json['profilePic'],
    );
  }
}
class Feed {
  final String id;
  final String title;
  final String description;
  final int views;
  final List<dynamic> likes;
  final int dislikes;
  final List<String> tags;
  final String thumbnailUrl;
  final bool isPrivate;
  final String createdAt;
  final String videoUrl;
  final int commentsCount;
  final bool isLikedByMe;
  final UploaderDetails uploaderDetails;
  final String formattedTimeDifference;

  Feed({
    required this.id,
    required this.title,
    required this.description,
    required this.views,
    required this.likes,
    required this.dislikes,
    required this.tags,
    required this.thumbnailUrl,
    required this.isPrivate,
    required this.createdAt,
    required this.videoUrl,
    required this.commentsCount,
    required this.isLikedByMe,
    required this.uploaderDetails,
    required this.formattedTimeDifference,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      views: json['views'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      tags: List<String>.from(json['tags']),
      thumbnailUrl: json['thumbnailUrl'],
      isPrivate: json['isPrivate'],
      createdAt: json['createdAt'],
      videoUrl: json['videoUrl'],
      commentsCount: json['commentsCount'],
      isLikedByMe: json['isLikedByMe'],
      uploaderDetails: UploaderDetails.fromJson(json['uploaderDetails']),
      formattedTimeDifference: json['formattedTimeDifference'],
    );
  }
}

class UploaderFeedDetails {
  final String id;
  final String username;
  final String profilePic;

  UploaderFeedDetails({
    required this.id,
    required this.username,
    required this.profilePic,
  });

  factory UploaderFeedDetails.fromJson(Map<String, dynamic> json) {
    return UploaderFeedDetails(
      id: json['_id'],
      username: json['username'],
      profilePic: json['profilePic'],
    );
  }
}
class SingleVideo {
  final String id;
  final String key;
  final String title;
  final String description;
  final String uploader;
  final int views;
  final List<String> likes;
  final List<String> comments;
  final List<String> tags;
  final String uploadDate;
  final String thumbnailUrl;
  final bool isPrivate;
  final String videoUrl;

  SingleVideo( {
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.uploader,
    required this.views,
    required this.likes,
    required this.comments,
    required this.tags,
    required this.uploadDate,
    required this.thumbnailUrl,
    required this.isPrivate,
    required this.videoUrl,
  });

  factory SingleVideo.fromJson(Map<String, dynamic> json) {
    return SingleVideo(
      id: json['_id'],
      key: json['key'],
      title: json['title'],
      description: json['description'],
      uploader: json['uploader'],
      views: json['views'],
      tags: List<String>.from(json['tags']),
      uploadDate: json['uploadDate'],
      thumbnailUrl: json['thumbnailUrl'],
      isPrivate: json['isPrivate'],
      videoUrl: json['videoUrl'],
      likes: ['likes'],
      comments: ['comments'],
    );
  }
}

class ApiResponse {
  final bool success;
  final String message;
  final SingleVideo video;
  final String formattedTimeDifference;
  final bool isLikedByMe;

  ApiResponse({
    required this.success,
    required this.message,
    required this.video,
    required this.formattedTimeDifference,
    required this.isLikedByMe,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      video: SingleVideo.fromJson(json['video']),
      formattedTimeDifference: json['formattedTimeDifference'],
      isLikedByMe: json['isLikedByMe'],
    );
  }
}
