typedef Json = Map<String, dynamic>;

class User {
  final String name;
  final String userName;
  final String avatar;
  final int followers;
  final int following;

  User(
      {required this.name,
      required this.userName,
      required this.avatar,
      required this.followers,
      required this.following});
  factory User.fromJson(Json json) {
    return User(
        name: json['name'],
        userName: json['login'],
        avatar: json['avatar_url'],
        followers: json['followers'],
        following: json['following']);
  }
}
