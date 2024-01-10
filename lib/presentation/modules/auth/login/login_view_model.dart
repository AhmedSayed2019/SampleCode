import 'package:base_app/core/utils/globals.dart';
import 'package:base_app/core/utils/remember_me/remember_me_helper.dart';
import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/logger.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/usecase/auth/login_usecase.dart';
import 'package:base_app/domain/usecase/local/save_data_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/auth_entity.dart';


class LoginViewModel extends ChangeNotifier{
final _tag ='SignInViewModel';
final LoginUseCase _signInUseCase;
final SaveUserDataUseCase _saveUserDataUseCase;
final RememberMeHelper _rememberMeHelper;

  LoginViewModel({
    required SaveUserDataUseCase saveUserDataUseCase,
    required LoginUseCase signInUseCase,
    required RememberMeHelper rememberMeHelper,
  })  : _saveUserDataUseCase = saveUserDataUseCase,
        _rememberMeHelper = rememberMeHelper,
        _signInUseCase = signInUseCase;

  ///variables
  bool _isLoading = false;
  late LoginParameters _parameters = LoginParameters();
  bool _isRememberMeEnable = false;

  ///getters
  bool get isLoading => _isLoading;
  LoginParameters get parameters => _parameters;
  bool get isRememberMeEnable => _isRememberMeEnable;



  init() async{
    await _rememberMeHelper.init();
    _parameters = _rememberMeHelper.parameters??LoginParameters();
    _isRememberMeEnable = _rememberMeHelper.isRememberMeEnable;
    notifyListeners();
  }

  //on update is remember me
  void onUpdateRememberMeEnable(bool? enable) {_isRememberMeEnable = enable??!_isRememberMeEnable;notifyListeners();}


  ///colling api functions


  // login user and save user data
  Future<ResponseModel<AuthEntity>> login(String email, String password) async {

    _parameters.setData(email: email, password: password);
    log(_tag, _parameters.toJson().toString());
    _isLoading = true;
    notifyListeners();
    ResponseModel<AuthEntity> responseModel = await _signInUseCase.call(loginParameters: _parameters);
    if (responseModel.isSuccess && responseModel.data != null) {
      AuthEntity authEntity = responseModel.data!;

      kUser = authEntity.user;
      await _saveUserDataUseCase.call(token: authEntity.token);
      _rememberMeHelper.saveData(isRememberMe: _isRememberMeEnable, email: email, password: password);

    }

    _isLoading = false;
    notifyListeners();

    return responseModel;
  }



}