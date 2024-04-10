
class AllUserData {
final String id;
final String username;
final String profilePic;

AllUserData({
required this.id,
required this.username,
required this.profilePic,
});

factory AllUserData.fromJson(Map<String, dynamic> json) {
return AllUserData(
id: json['_id'],
username: json['username'],
profilePic: json['profilePic'],
);
}
}