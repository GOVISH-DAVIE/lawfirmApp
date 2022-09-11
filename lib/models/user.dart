class User {
  String? token;
  int? userId;
  String? username;

  User({this.token, this.userId, this.username});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['user_id'] = userId;
    data['username'] = username;
    return data;
  }
}
