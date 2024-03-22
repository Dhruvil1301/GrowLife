class Video {
  final String id;
  final String key;
  final String title;
  final String description;
  final String uploader;
  final int views;
  final int likes;
  final int dislikes;
  final List<String> tags;
  final DateTime uploadDate;
  final String thumbnailUrl;
  final bool isPrivate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String videoUrl;

  Video({
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.uploader,
    required this.views,
    required this.likes,
    required this.dislikes,
    required this.tags,
    required this.uploadDate,
    required this.thumbnailUrl,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
    required this.videoUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      key: json['key'],
      title: json['title'],
      description: json['description'],
      uploader: json['uploader'],
      views: json['views'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      tags: List<String>.from(json['tags'] ?? []),
      uploadDate: DateTime.parse(json['uploadDate']),
      thumbnailUrl: json['thumbnailUrl'],
      isPrivate: json['isPrivate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      videoUrl: json['videoUrl'],
    );
  }
}
