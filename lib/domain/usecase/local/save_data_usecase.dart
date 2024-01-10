
import 'package:base_app/domain/logger.dart';

import '../../../data/model/base/response_model.dart';
import '../../repository/local_repo.dart';

class SaveUserDataUseCase {

  final LocalRepository _repository;

  const SaveUserDataUseCase({
    required LocalRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call({required String token}) async {

    bool? isSaveToken = await _repository.saveSecuredData(token);
    log('SaveUserDataUseCase', 'isSaveToken==>$isSaveToken==>$token');
    if (isSaveToken ) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }


}
