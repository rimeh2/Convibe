class RequestAuthentication {
  String? email;
  String? password;

  RequestAuthentication({this.email, this.password});

  RequestAuthentication.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  @override
  String toString() {
    return 'RequestAuthentication{email: $email, password: $password}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
