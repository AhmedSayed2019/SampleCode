
import 'dart:convert';

import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/logger.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app.dart';
import '../../core/services/local/cache_consumer.dart';
import '../../core/services/local/storage_keys.dart';
import '../../domain/repository/local_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
class LocalRepositoryImp implements LocalRepository {
  final DioClient? _dioClient;
  final CacheConsumer _cacheConsumer;

  LocalRepositoryImp({
    required DioClient? dioClient,
    required CacheConsumer cacheConsumer,
  })  : _dioClient = dioClient,
        _cacheConsumer = cacheConsumer;


  // for  user token
  @override
  Future<bool> saveSecuredData(String token) async {
    await _cacheConsumer.saveSecuredData(StorageKeys.kToken, token);
    log('saveSecuredData', 'token :$token');
    _dioClient!.token = token;
    _dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'x-api-key': AppURL.kAPIKey,
      'Content-Language': appContext?.locale.languageCode ?? 'en',
      'Authorization': 'Bearer $token'
    };

    return await _cacheConsumer.save(StorageKeys.kIsAuthed, true) ;
  }

  @override
  Future<bool> saveUserType(UserType userType) async {
    return await _cacheConsumer.save(StorageKeys.kUserType, userType.name);
  }

  @override
  Future<UserType> getUserType() async {
    String type =  await _cacheConsumer.get(StorageKeys.kUserType)??'';
   return getUserTypeByKey(type);
  }
  @override
  Future<String> getUserToken() async {

    return await _cacheConsumer.getSecuredData(StorageKeys.kToken)??'';
  }

  @override
  bool isLoggedIn() {
    return _cacheConsumer.get(StorageKeys.kIsAuthed) ?? false;
  }

  @override
  Future<bool> clearSharedData() async {
    _cacheConsumer.deleteSecuredData();
    _cacheConsumer.delete(StorageKeys.kIsAuthed);
    _dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'x-api-key': AppURL.kAPIKey,
      'Content-Language': appContext?.locale.languageCode ?? 'en',
      'Authorization': null
    };
    return _cacheConsumer.delete(StorageKeys.kToken);
  }

  @override
  bool getIsRememberMe() =>
      _cacheConsumer.get(StorageKeys.kIsRememberMe) ?? false;

  @override
  Future<bool> setRememberMe(bool isRememberMe)  =>
      _cacheConsumer.save(StorageKeys.kIsRememberMe, isRememberMe);


  @override
  Future<bool> saveLoginData(LoginParameters loginBody) async{
    log('saveUserPhoneAndPassword', loginBody.toString());
    String body = jsonEncode(loginBody.toJson());

    log('saveUserPhoneAndPassword', body);
    return await _cacheConsumer.save(StorageKeys.kRememberMeData, body) ;

  }

  @override
  Future<LoginParameters?> getUserPhoneAndPassword()async{

    String? data =_cacheConsumer.get(StorageKeys.kRememberMeData) ;
    if(data!=null){
      LoginParameters? parameters = LoginParameters.fromJson(jsonDecode(data));
      return parameters;
    }
    return null;
  }
}
