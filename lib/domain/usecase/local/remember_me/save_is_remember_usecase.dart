import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/repository/local_repo.dart';

class SaveIsRememberUseCase {
  final LocalRepository _repository;

  SaveIsRememberUseCase({
    required LocalRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call(bool isRememberMe) async {
    bool isSave = await _repository.setRememberMe(isRememberMe);
    if (isSave) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
