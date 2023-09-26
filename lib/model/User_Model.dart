class UserModel {
  String? userId, email, name, password;

  UserModel({this.userId, this.email, this.name, this.password});

  UserModel.fromJson(Map<String, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    password = map['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'password': password,
    };
  }
}
