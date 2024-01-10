import 'dart:async';

import 'package:base_app/domain/parameters/auth/social_signIn_parameters.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthHelper {

 static Future<SocialSignInParameters?> login() async {
    try {
// by default the login method has the next permissions ['email','public_profile']
//       await FacebookAuth.instance.login();

      LoginResult loginResult = await FacebookAuth.instance.login();
      // get the user data
      if (loginResult.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();

        return SocialSignInParameters(
            website: 'facebook',
            userId: userData['id'],
            email: userData['email'],
            name: userData['name'],
            image: userData['picture']['data']['url']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
