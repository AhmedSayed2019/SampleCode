

import 'package:base_app/domain/parameters/auth/social_signIn_parameters.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/logger.dart';


class GoogleAuthHelper{

  static Future<SocialSignInParameters?> login() async {
    log('GoogleAuthHelper', 'Start');

    GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId:
      //     'AIzaSyAb2JYam9I4GjxpJPvq6XklBNDCghbWcNs.apps.googleusercontent.com',
      scopes: [
        'email',
      ],
    );
    String? email;
    String? userId;
    String? displayName;
    String? image;
    log('GoogleAuthHelper', 'Start');

    await googleSignIn.signIn().then((googleSignInAccount) async {
      email = googleSignInAccount?.email;
      userId = googleSignInAccount?.id;
      displayName = googleSignInAccount?.displayName;

      image = googleSignInAccount?.photoUrl;
      log('GoogleAuthHelper', 'userId $userId ,email $email, image ${image} , image ${image} ,name $displayName');
      if (googleSignInAccount == null) {
        log('GoogleAuthHelper', 'googleSignInAccount == null');

        return null;
      }
      await googleSignInAccount.authentication.then((auth) async {
        log('GoogleAuthHelper', 'idToken ${auth.idToken}');
        log('GoogleAuthHelper', 'accessToken ${auth.accessToken}');
        // print(loginArgs.toJson());
      });
    });
    log('GoogleAuthHelper', ' userId: $userId, email: $email, name: $displayName, image: $image');
    if(userId==null)return null;
    return  SocialSignInParameters(website: 'google', userId: userId, email: email, name: displayName, image: image);
    // return await _socialSignIn(context: context, website: 'google', user_id: userId, email: email, lastName: lastName, firstName: firstName, image: image);



  }

}

