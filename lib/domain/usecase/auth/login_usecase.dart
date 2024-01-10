

import 'package:base_app/data/model/base/base_model.dart';
import 'package:base_app/domain/entities/auth_entity.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/repository/auth_repo.dart';
import 'package:base_app/domain/usecase/base_usecase/base_use_case_call.dart';
import 'package:base_app/domain/usecase/base_usecase/base_usecase.dart';
import'package:base_app/data/model/response/auth_model.dart';


import '../../../data/datasource/remote/exception/api_checker.dart';
import '../../../data/model/base/response_model.dart';


class LoginUseCase implements BaseUseCase<AuthEntity>{
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<AuthEntity>> call({ required LoginParameters loginParameters}) async =>
     BaseUseCaseCall.onGetData<AuthEntity>( await _repository.login(parameters: loginParameters), onConvert,tag: 'LoginUseCase',showError: true);


  @override
  ResponseModel<AuthEntity> onConvert(BaseModel baseModel) {
    String? token = (baseModel.response['access_token']??'').toString();
    if (token.isNotEmpty) {
      AuthEntity entity = AuthModel.fromJson(baseModel.response);
      return ResponseModel(true, baseModel.message, data: entity);
    } else {
      return ApiChecker.checkApi(message: baseModel.message);
    }
  }


}
