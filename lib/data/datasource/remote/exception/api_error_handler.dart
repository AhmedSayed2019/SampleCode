import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../domain/logger.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../model/base/error_response.dart';
import 'error_widget.dart';

class ApiErrorHandler {
  static ErrorModel getMessage(error) {
    if (error is Exception) {

      try {
        if (error is DioError) {
          log('ApiErrorHandler', '${error.response?.statusCode??''} == ${error.type}');

          switch (error.type) {
            case DioErrorType.cancel:
              return  ErrorModel(code: ErrorEnum.cancel,errorMessage: tr(LocaleKeys.noConnection));
            case DioErrorType.connectTimeout:
              return   ErrorModel(code: ErrorEnum.connectTimeout,errorMessage: tr(LocaleKeys.noConnection));
            case DioErrorType.receiveTimeout:
              return  ErrorModel(code: ErrorEnum.receiveTimeout,errorMessage: tr(LocaleKeys.noConnection));
            case DioErrorType.sendTimeout:
              return  ErrorModel(code: ErrorEnum.sendTimeout,errorMessage: tr(LocaleKeys.noConnection));
            case DioErrorType.other:
              return  ErrorModel(code: ErrorEnum.other,errorMessage: tr(LocaleKeys.noConnection),);
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 503:return ErrorModel(code: ErrorEnum.server,errorMessage:  error.response?.statusMessage??'server');

                case 401:return const ErrorModel(code: ErrorEnum.auth,errorMessage:  'Unauthorized');
                case 404:
                case 500:
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.message != null && errorResponse.message!.isNotEmpty) {
                    log('ApiErrorHandler', 'default ${errorResponse.message}');
                    return ErrorModel(code: ErrorEnum.otherError,errorMessage:  errorResponse.message??'Error');
                  } else {
                    return  ErrorModel(code: ErrorEnum.otherError,errorMessage: "Failed to load data - status code: ${error.response!.statusCode}");
                  }
              }
              break;

          }
        } else {
          return   const ErrorModel(code: ErrorEnum.otherError,errorMessage: "Unexpected error occured");
        }
      } on FormatException catch (e) {
        return  ErrorModel(code: ErrorEnum.otherError,errorMessage:  e.toString());
      }catch (e){
        return  ErrorModel(code: ErrorEnum.otherError,errorMessage:  e.toString());
      }
    } else {
      return  const ErrorModel(code: ErrorEnum.otherError,errorMessage:  "is not a subtype of exception");
    }
  }
}
