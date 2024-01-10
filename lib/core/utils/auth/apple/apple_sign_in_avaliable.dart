// import 'package:apple_sign_in_safety/apple_sign_in.dart';
//
// class AppleSignInAvailable{
//   final bool _isAvailable ;
//
//  static AppleSignInAvailable? _instance ;
//
//   const AppleSignInAvailable({
//     required bool isAvailable,
//   }) : _isAvailable = isAvailable;
//
//   bool get isAvailable => _isAvailable;
//
//   static Future<AppleSignInAvailable> check() async{
//     if(_instance==null){
//       _instance= AppleSignInAvailable(isAvailable: await AppleSignIn.isAvailable());
//     }
//     return _instance!;
//   }
// }