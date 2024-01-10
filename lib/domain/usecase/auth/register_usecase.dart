

import 'package:base_app/data/model/base/base_model.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';
import 'package:base_app/domain/repository/auth_repo.dart';
import 'package:base_app/domain/usecase/base_usecase/base_use_case_call.dart';
import 'package:base_app/domain/usecase/base_usecase/base_usecase.dart';

import '../../../data/model/base/response_model.dart';


class RegisterUseCase implements BaseUseCase{

  final AuthRepository _repository;
  RegisterUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call({ required RegisterParameters registerParameters}) async =>
     BaseUseCaseCall.onGetData( await _repository.register(parameters: registerParameters), onConvert,tag: 'UserRegisterUseCase');



  @override
  ResponseModel onConvert(BaseModel baseModel) {
      return ResponseModel(true, baseModel.message);

  }
}
