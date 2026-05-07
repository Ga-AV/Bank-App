
class UserPasswordModel {
  String email;
  String password;
  UserPasswordModel({required this.email, required this.password});

  factory UserPasswordModel.fromEntity(Map<String, dynamic> json) {
    return UserPasswordModel(email: json["email"], password: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }
}