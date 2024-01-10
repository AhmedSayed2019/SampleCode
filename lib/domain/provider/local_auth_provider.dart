
import 'package:flutter/widgets.dart';
import 'package:base_app/domain/logger.dart';

import '../../core/utils/globals.dart';
import '../../data/model/base/response_model.dart';
import '../usecase/local/clear_user_data_usecase.dart';
import '../usecase/local/get_is_login_usecase.dart';
import '../usecase/profile/get_profile_usecase.dart';

class LocalAuthProvider with ChangeNotifier {
  final _tag='LocalAuthProvider';

  ///Use Cases
  final IsUserLoginUseCase _isUserLoginUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final ClearUserDataUseCase _clearUserDataUseCase;

  LocalAuthProvider({
    required ClearUserDataUseCase clearUserDataUseCase,
    required IsUserLoginUseCase isUserLoginUseCase,
    required GetProfileUseCase getProfileUseCase,
  })
      : _clearUserDataUseCase = clearUserDataUseCase,
        _isUserLoginUseCase = isUserLoginUseCase,
        _getProfileUseCase = getProfileUseCase;

  ///Variables
  bool _isLogin =false;
  bool _loading = false;
  String? _error;

  ///Getters
  bool get isAuth => _isLogin;
  bool get loading => _loading;
  String? get error => _error;


  ///call APIs Functions
  Future<bool> isLogin() async {
    ResponseModel responseModel = await _isUserLoginUseCase.call();
    if (responseModel.isSuccess) {
      _isLogin = true;

      ResponseModel profileResponseModel = await getUser();
      return profileResponseModel.isSuccess;
    } else {
      logOut();
    }
    return responseModel.isSuccess;
  }

  Future<bool> logOut() async {
    deleteLocalData();
    _isLogin = false;
    kUser = null;
    notifyListeners();

    return true;
  }

  Future<bool> deleteLocalData() async {

    ResponseModel responseModel = await _clearUserDataUseCase.call();
    if (responseModel.isSuccess) {
      // FirebaseMessaging.instance.deleteToken();
      _isLogin = false ;
       kUser = null ;
       notifyListeners();
    }
    return responseModel.isSuccess;
  }

  Future<ResponseModel> getUser() async {
    log(_tag, 'getUser');
    notify(true, null);

    ResponseModel responseModel = await _getProfileUseCase.call();
    if (responseModel.isSuccess) {
      kUser = responseModel.data;
      notify(false, null);
    } else {
      logOut();
      notify(false, responseModel.message);
    }
    return responseModel;
  }



  ///update screens status Function
  void notify(bool loading, String? error) {
    _loading = loading;
    _error = error;
    notifyListeners();
  }

}
