
import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/repository/local_repo.dart';

import '../../../logger.dart';

class SaveLoginDataUseCase {
  final _tag = 'SaveLoginDataUseCase';
  final LocalRepository _repository;

  Future<ResponseModel> call({
     String? token,
    required LoginParameters parameters,
  }) async {
    log(_tag, 'start');

    bool isSaveUser = await _repository.saveLoginData(parameters);
    log(_tag, 'is saved $isSaveUser');
    if (isSaveUser) {
      log(_tag, 'save data successful Done');
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }

  const SaveLoginDataUseCase({
    required LocalRepository repository,
  }) : _repository = repository;
}
