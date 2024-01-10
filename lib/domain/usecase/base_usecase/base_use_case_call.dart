

import 'package:base_app/core/utils/alerts.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:base_app/domain/logger.dart';

import '../../../data/datasource/remote/exception/api_checker.dart';
import '../../../data/model/base/api_response.dart';
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
class BaseUseCaseCall<R>{
  static ResponseModel<R> onGetData<R>(ApiResponse apiResponse, ResponseModel<R> Function(BaseModel baseModel) onConvert,{bool showError = true,bool showSuccess = false,String? tag}){
    ResponseModel<R> responseModel;

    _log(tag,apiResponse.response );
    if (apiResponse.response != null &&( apiResponse.response!.statusCode == 200 || apiResponse.response!.statusCode == 201) ) {
      BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      if (baseModel.status) {
        _log(tag,'getData successfully');
        if (kDebugMode) {
          _log(tag,'getData kDebugMode');
          try{
            if(showSuccess) Alerts.showSnackBar(baseModel.responseData[0],alertsType: AlertsType.success);
          }catch(e){
            if(showSuccess) Alerts.showSnackBar(tr(LocaleKeys.createdSuccessfully),alertsType: AlertsType.success);
          }
          responseModel = onConvert(baseModel);
        } else{
          try {
            responseModel = onConvert(baseModel);
            try{
              if(showSuccess) Alerts.showSnackBar(baseModel.responseData[0],alertsType: AlertsType.success);
            }catch(e){}
          } catch (e) {
            _log(tag,'getData onConvert Error');
            responseModel = ApiChecker.checkApi<R>( message: baseModel.message);
          }
        }
      } else {
        _log(tag,'getData onConvert Error ${ baseModel.responseData[0]}');

        responseModel = ApiChecker.checkApi<R>(showError: showError, message: baseModel.responseData[0]);
        // responseModel = ApiChecker.checkApi<R>(showError: showError, message: apiResponse.response?.data);
      }
    } else {
      _log(tag,'getData onConvert API Error - ${apiResponse.error??apiResponse.response?.data['message']}');

      responseModel =ApiChecker.checkApi<R>(showError: showError, errorModel: apiResponse.error,);

      // responseModel = ApiChecker.checkApi<R>(showError: showError,apiResponse: ApiResponse.withError(apiResponse.error??apiResponse.response?.data['message']));
    }
    return responseModel;
  }


}
_log(String? tag,var massage){
  if (tag!=null) {
    log(tag, 'response :$massage ');
  }
}