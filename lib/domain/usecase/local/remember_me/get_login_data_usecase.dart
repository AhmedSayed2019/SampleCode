

import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/repository/local_repo.dart';

import 'package:base_app/data/model/base/response_model.dart';

import '../../../logger.dart';

class GetLoginDataUseCase {
  final _tag = 'GetLoginDataUseCase';
  final LocalRepository _repository;

  const GetLoginDataUseCase({
    required LocalRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<LoginParameters?>> call() async {
    LoginParameters? parameters =await  _repository.getUserPhoneAndPassword();

    if (parameters != null ) {
      log(_tag, parameters.toString());
      return ResponseModel< LoginParameters?>(true, 'successful',data: parameters);
    } else {
      return ResponseModel< LoginParameters?>(false, 'error');
    }
  }

}
