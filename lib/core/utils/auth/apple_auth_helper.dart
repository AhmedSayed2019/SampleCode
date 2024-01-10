import 'dart:async';

import 'package:apple_sign_in_safety/apple_sign_in.dart';
import 'package:base_app/domain/parameters/auth/social_signIn_parameters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';


class AppleAuthHelper {
 static final _firebaseAuth = FirebaseAuth.instance;

 static Future<SocialSignInParameters> login() async {
    // 1. perform the sign-in request
    final result = await AppleSignIn.performRequests(
        [const AppleIdRequest(requestedScopes:  [Scope.fullName])]);
    // 2. check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
          final fullName = appleIdCredential.fullName;
          if (fullName !=
              null /* && fullName.givenName != null && fullName.familyName != null*/) {
            final displayName =
                '${fullName.givenName ?? ''} ${fullName.familyName ?? ''}';
            await firebaseUser.updateDisplayName(displayName);
          }

        return SocialSignInParameters(
            website: 'apple',
            userId: firebaseUser.uid,
            email: firebaseUser.email,
            name: firebaseUser.displayName,
            image: firebaseUser.photoURL);

      case AuthorizationStatus.error:
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );

      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      default:
        throw UnimplementedError();
    }
  }
}
