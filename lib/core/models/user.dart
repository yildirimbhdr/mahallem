class User {
  int userId;
  String userName;
  String email;
  String password;

  User({this.userId, this.userName, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
