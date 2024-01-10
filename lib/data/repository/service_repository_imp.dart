import 'dart:async';

import 'package:base_app/data/datasource/remote/dio/dio_client.dart';
import 'package:base_app/data/model/base/api_response.dart';
import 'package:base_app/domain/repository/service_repo.dart';
import 'package:dio/dio.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class ServiceRepositoryImp implements ServiceRepository{
  final DioClient _dioClient;

  ServiceRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;



  @override
  Future<ApiResponse> getServices () async {
    try {
      Response response = await _dioClient.get(AppURL.kGetServiceURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  @override
  Future<ApiResponse> getPopularServices() async {
    try {
      Response response = await _dioClient.get(AppURL.kGetServicePopularURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
