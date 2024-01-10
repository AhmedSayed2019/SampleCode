import 'package:base_app/data/datasource/remote/exception/error_widget.dart';
import 'package:dio/dio.dart';


class ApiResponse<T> {
  final Response<T>? response;
  final ErrorModel? error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(Response<T> responseValue)
      : response = responseValue,
        error = null;

}

