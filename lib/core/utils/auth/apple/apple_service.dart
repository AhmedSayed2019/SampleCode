// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:apple_sign_in_safety/apple_sign_in.dart';
//
// class AppleService {
//   final _firebaseAuth = FirebaseAuth.instance;
//
//   Future<User> signInWithApple({List<Scope> scopes = const [Scope.fullName]}) async {
//     // 1. perform the sign-in request
//     final result = await AppleSignIn.performRequests([AppleIdRequest(requestedScopes: scopes)]);
//     // 2. check the result
//     switch (result.status) {
//       case AuthorizationStatus.authorized:
//         final appleIdCredential = result.credential!;
//         final oAuthProvider = OAuthProvider('apple.com');
//         final credential = oAuthProvider.credential(
//           idToken: String.fromCharCodes(appleIdCredential.identityToken!),
//           accessToken:
//           String.fromCharCodes(appleIdCredential.authorizationCode!),
//         );
//         final userCredential = await _firebaseAuth.signInWithCredential(credential);
//         final firebaseUser = userCredential.user!;
//         if (scopes.contains(Scope.fullName)) {
//           final fullName = appleIdCredential.fullName;
//           if (fullName != null/* && fullName.givenName != null && fullName.familyName != null*/) {
//             final displayName = '${fullName.givenName??''} ${fullName.familyName??''}';
//             await firebaseUser.updateDisplayName(displayName);
//           }
//         }
//         return firebaseUser;
//       case AuthorizationStatus.error:
//         throw PlatformException(
//           code: 'ERROR_AUTHORIZATION_DENIED',
//           message: result.error.toString(),
//         );
//
//       case AuthorizationStatus.cancelled:
//         throw PlatformException(
//           code: 'ERROR_ABORTED_BY_USER',
//           message: 'Sign in aborted by user',
//         );
//       default:
//         throw UnimplementedError();
//     }
//   }
// }