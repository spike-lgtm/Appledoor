class User {
  String username;
  String password;
  String fullName;
  String email;
  String instituteName;
  String eduLevel;
  String major;

  final String? token;

  User(
      {required this.username,
        required this.password,
      required this.fullName,
      required this.email,
      required this.instituteName,
      required this.eduLevel,
      required this.major,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: "",
      fullName: json['fullName'],
      email: json['email'],
      instituteName: json['instituteName'],
      eduLevel: json['eduLevel'],
      major: json['major'],
      token: json['token'],
    );
  }

  factory User.blankUser() {
    return User(
      username: "",
      password: "",
      fullName: "",
      email: "",
      instituteName: "",
      eduLevel: "",
      major: "",
      token: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fullName': fullName,
      'password': password,
      'email': email,
      'instituteName': instituteName,
      'eduLevel': eduLevel,
      'major': major,
      'token': token,
    };
  }
}

class LoginData {
  final String username;
  final String password;

  LoginData({required this.username, required this.password});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
