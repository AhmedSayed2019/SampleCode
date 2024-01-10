import 'dart:async';

import 'package:base_app/data/model/base/api_response.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';
import 'package:base_app/domain/repository/auth_repo.dart';
import 'package:dio/dio.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class AuthRepositoryImp implements AuthRepository{
  final DioClient _dioClient;

  AuthRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> login({required LoginParameters parameters}) async {

    try {
      Response response = await _dioClient.post(AppURL.kLoginURI, queryParameters: parameters.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> register({required RegisterParameters parameters})  async {
    try {
      Response response = await _dioClient.post(AppURL.kRegisterURI, queryParameters: parameters.toJson(),filePath: parameters.image,fileName: 'avatar');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



}
