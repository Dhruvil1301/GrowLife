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
