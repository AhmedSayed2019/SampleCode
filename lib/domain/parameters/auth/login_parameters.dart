
class LoginParameters {
  String? _email;
  String? _password;

  LoginParameters({
    String? email,
    String? password,
  })  : _password = password,
        _email = email;

  String? get password => _password;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    return {
      "password": _password,
      "email": _email,
    };
  }

  factory LoginParameters.fromJson(Map<String, dynamic> json) =>
      LoginParameters(email: json['email']??'', password: json['password']??'');

  setData({
    required String email,
    required String password,
  }) {
    _email = email;
    _password = password;
  }


}
