
import 'package:base_app/core/routing/navigation_services.dart';
import 'package:base_app/core/routing/routes.dart';
import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/logger.dart';
import 'package:base_app/domain/provider/local_auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../app.dart';
import '../../../../core/utils/alerts.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../model/base/api_response.dart';
import '../../../model/base/error_response.dart';
import 'error_widget.dart';

class ApiChecker {
  static const _tag = 'ApiChecker';
  static ResponseModel<T> checkApi<T>({bool showError=true, String? message, ErrorModel? errorModel}) {
    // log(_tag, 'checkApi  $message');
    if (message != null) {
      _showAlert(message, showError);
      return ResponseModel<T>(false, tr(LocaleKeys.error));
    } else if (errorModel != null) {
      if (errorModel.code == ErrorEnum.auth) {_onLogout();}else{_showAlert(errorModel.errorMessage, showError);}
      return ResponseModel<T>(false, tr(LocaleKeys.error));
    }  else {
      _showAlert(tr(LocaleKeys.error), showError);
      return ResponseModel<T>(false, tr(LocaleKeys.error));
    }
  }

  static ResponseModel<T> checkApi1<T>({bool showError=true,ApiResponse? apiResponse, dynamic message}) {
    // log(_tag, 'checkApi  $message');

    try{
      ErrorResponse errorResponse = ErrorResponse.fromJson(message);
      log(_tag, 'Error Massage  ${errorResponse.message}');

      if (errorResponse.message != null && errorResponse.message!.isNotEmpty) {
        // log(_tag, 'ErrorResponse Data  ${errorResponse.message}');
        _showAlert(errorResponse.message, showError);
        return ResponseModel<T>(false, errorResponse.message);
      } else {
        _showAlert(tr(LocaleKeys.error), showError);
        return  ResponseModel<T>(false, tr(LocaleKeys.error));
      }

    }catch(e){
      ErrorModel? errorModel = apiResponse?.error;
      log(_tag, 'errorModel == ${errorModel.toString()}');

      if (errorModel != null) {
        _showAlert(errorModel.errorMessage, showError);
        return ResponseModel<T>(false, tr(LocaleKeys.error));
      } else {
        log(_tag, 'apiResponse Can not get error');
        _showAlert(tr(LocaleKeys.error), showError);
        return ResponseModel<T>(false, tr(LocaleKeys.error));
      }

      // log(_tag, 'Error catch  $e');
      //
      // log(_tag, 'ErrorResponse = $apiResponse  && message =$message');
      // if (apiResponse != null) {
      //   log(_tag, 'apiResponse != null  ${apiResponse.response?.data}');
      //   log(_tag, 'apiResponse != null  ${apiResponse.error}');
      //   if (apiResponse.error is ErrorResponse) {
      //     log(_tag, 'apiResponse is ErrorResponse');
      //     ErrorResponse error = apiResponse.error;
      //     _showAlert(error.message, showError);
      //     return ResponseModel<T>(false, error.message);
      //   } else if (apiResponse.error is ErrorModel) {
      //     log(_tag, 'apiResponse is ErrorModel');
      //     return _handleErrorErrorModel(apiResponse.error as ErrorModel);
      //   } else if (apiResponse.error is String) {
      //     log(_tag, 'apiResponse is String');
      //     _showAlert(apiResponse.error, showError);
      //     return ResponseModel<T>(false, apiResponse.error);
      //   } else {
      //     log(_tag, 'apiResponse Can not get error');
      //     return ResponseModel<T>(false, tr(LocaleKeys.error));
      //   }
      //   } else if (message != null) {
      //     log(_tag, 'Error is message');
      //     _showAlert(message, showError);
      //     return ResponseModel<T>(false, message);
      //   } else {
      //     log(_tag, 'Can not get error');
      //     return ResponseModel<T>(false, tr(LocaleKeys.error));
      //   }
    }
  }

  static ResponseModel<T> _handleErrorErrorModel<T>(ErrorModel error) {
    if (error.code == ErrorEnum.auth) {
      _onLogout();
    }
    return ResponseModel<T>(false, error.errorMessage, error: error);
  }

  static _showAlert(String? error,bool showError ) {
    if (error != null && showError) Alerts.showSnackBar(error);
  }
  static _onLogout() {
    if (appContext ==null) {return;}
    Provider.of<LocalAuthProvider>(appContext!, listen: false).deleteLocalData().then((isCleared) {
      NavigationService.goBack();
      NavigationService.pushNamedAndRemoveUntil(Routes.loginScreen);
    });
  }
}
