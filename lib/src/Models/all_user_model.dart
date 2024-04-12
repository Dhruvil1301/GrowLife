
class AllUserData {
final String id;
final String username;
final String profilePic;
final bool isFollowedByMe;

AllUserData( {
required this.id,
required this.username,
required this.profilePic,
  required this.isFollowedByMe,
});

factory AllUserData.fromJson(Map<String, dynamic> json) {
return AllUserData(
id: json['_id'],
username: json['username'],
profilePic: json['profilePic'],
  isFollowedByMe: json['isFollowedByMe'],
);
}
}