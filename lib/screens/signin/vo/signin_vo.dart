class SignInVO {
  String username;
  String password;
  String accessToken;
  String auth;
  String role;

  SignInVO(
      {this.username = '',
        this.password = '',
        this.accessToken = '',
        this.auth = '',
        this.role = ''});

  factory SignInVO.fromJson(Map<String, dynamic> json) {
    try {
      return SignInVO(
        username: json['username'] ?? '',
        password: json['password'] ?? '',
        accessToken: json['accessToken'] ?? '',
        auth: json['auth'] ?? '',
        role: json['role'] ?? '',
      );
    } catch (e) {
      return SignInVO();
    }
  }
}