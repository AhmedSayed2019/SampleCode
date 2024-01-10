



import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/usecase/local/remember_me/get_is_remember_me_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/get_login_data_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/save_is_remember_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/save_login_data_usecase.dart';

import '../../../domain/logger.dart';

class RememberMeHelper {

  final GetIsRememberMeUseCase _getIsRememberMeUseCase;
  final SaveIsRememberUseCase _saveIsRememberUseCase;
  final GetLoginDataUseCase _getLoginDataUseCase;
  final SaveLoginDataUseCase _saveLoginDataUseCase;

   RememberMeHelper({
    required GetIsRememberMeUseCase getIsRememberMeUseCase,
    required SaveIsRememberUseCase saveIsRememberUseCase,
    required GetLoginDataUseCase getLoginDataUseCase,
    required SaveLoginDataUseCase saveLoginDataUseCase,
  })  : _getIsRememberMeUseCase = getIsRememberMeUseCase,
        _saveIsRememberUseCase = saveIsRememberUseCase,
        _getLoginDataUseCase = getLoginDataUseCase,
        _saveLoginDataUseCase = saveLoginDataUseCase;

  LoginParameters? _parameters ;
  bool _isRememberMeEnable = false;


  LoginParameters? get parameters => _parameters;
  bool get isRememberMeEnable => _isRememberMeEnable;


  init() async{
    _parameters = null;
    //get if user has enabled remember option
    await _getIsRememberMeUseCase.call().then((response) =>_isRememberMeEnable = response.isSuccess);

    //get user body (phone , password) if user has enabled remember option
    if(isRememberMeEnable){
      await _getLoginDataUseCase.call().then((response) {
        if( response.isSuccess) {
          _parameters = response.data;
        }
      });
    }

    log('RememberMeHelper','isRememberMeEnable $isRememberMeEnable LoginParameters::${_parameters.toString()}');
  }
  saveData({required bool isRememberMe,required String email , required String password}){
    _saveIsRemember(isRememberMe: isRememberMe);
    if(isRememberMe){
      _saveLoginData(LoginParameters(email: email, password: password));
    }else{
      _saveLoginData(LoginParameters(email: '', password: ''));
    }
  }
  _saveIsRemember({required bool isRememberMe}){
    _saveIsRememberUseCase.call(isRememberMe);
  }

  _saveLoginData(LoginParameters body){
    _saveLoginDataUseCase.call(parameters:body );
  }
}