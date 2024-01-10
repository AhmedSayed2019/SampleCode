
import 'package:base_app/domain/parameters/auth/login_parameters.dart';

abstract class LocalRepository {

  Future<bool> saveSecuredData(String token);
  Future<bool> clearSharedData();
  bool isLoggedIn();
  Future<String> getUserToken();


  Future<bool> setRememberMe(bool isRememberMe);
  bool getIsRememberMe();

  Future<bool>  saveLoginData(LoginParameters parameters);
  Future<LoginParameters?> getUserPhoneAndPassword();
}
