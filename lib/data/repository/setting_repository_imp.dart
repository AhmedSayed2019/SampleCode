import 'dart:async';

import 'package:base_app/domain/parameters/suggestions_and_complaints_parameters.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/setting_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class SettingRepositoryImp implements SettingRepository{
  final DioClient _dioClient;

  SettingRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> getDependencies() async {
    try {
      Response response = await _dioClient.get(AppURL.kGetDependenciesURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  @override
  Future<ApiResponse> getCountries({required int page}) async {
    try {
      Response response = await _dioClient.get('${AppURL.kGetCountriesURL}?page=$page');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
