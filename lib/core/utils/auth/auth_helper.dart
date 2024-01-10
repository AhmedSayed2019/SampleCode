import 'package:base_app/domain/parameters/auth/social_signIn_parameters.dart';
import 'package:flutter/cupertino.dart';

import 'apple_auth_helper.dart';
import 'facebook_auth_helper.dart';
import 'google_auth_helper.dart';
enum AuthType { google, facebook, apple }
class AuthHelper{



  static Future<SocialSignInParameters?> auth(BuildContext context,{required AuthType authType})async{
    switch (authType) {
      case AuthType.google:return await GoogleAuthHelper.login();
      case AuthType.facebook:return await FacebookAuthHelper.login();
      case AuthType.apple:return await AppleAuthHelper.login();
    }

    // if (authType==AuthType.google) {
    // return  await GoogleAuthHelper.login();
    // } else if (authType==AuthType.apple) {
    //   return  await AppleAuthHelper.login();
    //
    // }else if (authType==AuthType.facebook) {
    //   return  await AppleAuthHelper.login();
    //
    // }
    // return null;
  }
}