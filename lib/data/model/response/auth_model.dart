import 'package:base_app/data/model/response/profile_model.dart';

import '../../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String token,
    required ProfileModel user,
  }) : super(user: user, token: token);

  factory AuthModel.fromJson(Map<String, dynamic>? json) {
    return AuthModel(
      token: json?["access_token"] ?? '',
      user: ProfileModel.fromJson(json?["data"] ?? {}),
    );
  }
}
