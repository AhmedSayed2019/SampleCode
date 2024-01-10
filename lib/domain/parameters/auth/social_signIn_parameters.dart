import 'dart:io';

class SocialSignInParameters {
  final String? _website;
  final String? _userId;
  final String? _email;
  final String? _name;
  final String? _image;
   String? _fcmToken;

   SocialSignInParameters({
    required String? website,
    required String? userId,
    required String? email,
    required String? name,
    required String? image,
     String? fcmToken,
  })  : _website = website,
        _userId = userId,
        _email = email,
        _fcmToken = fcmToken,
        _name = name,
        _image = image;

  setFcmToken(String? fcmToken){
    _fcmToken = fcmToken;
  }

  String? get image => _image;

  String? get name => _name;

  String? get email => _email;

  String? get userId => _userId;

  String? get website => _website;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "provider_name": _website,
      "social_id": _userId,
      "email": _email,
      "image": _image,
      "first_name": (_name??'').split(' ').first,
      "last_name": (_name??'').split(' ').last,
      "device_token": _fcmToken,
      "device_type": Platform.isIOS?'ios':'android',

    };

    return data;
  }
}