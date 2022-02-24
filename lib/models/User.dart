class MyUser {
  final String uid;
  final String name;
  final String username;
  final String profileImage;
  final String lastAccessTime;
  final String followers;
  final String following;
  final bool isNewUser;

  MyUser(
      {this.uid,
      this.name,
      this.username,
      this.profileImage,
      this.lastAccessTime,
      this.followers,
      this.following,
      this.isNewUser});

  factory MyUser.fromJson(json) {
    return MyUser(
      uid: json['uid'],
      name: json['name'],
      username: json['username'],
      profileImage: json['profileImage'],
      lastAccessTime: json['lastAccessTime'],
      followers: json['followers'],
      following: json['following'],
      isNewUser: json['isNewUser'],
    );
  }
}
