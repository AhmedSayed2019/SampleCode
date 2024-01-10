import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/repository/local_repo.dart';

class GetIsRememberMeUseCase {
  final LocalRepository _repository;

  GetIsRememberMeUseCase({
    required LocalRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call() async {
    bool isRemember =  _repository.getIsRememberMe();

    if (isRemember) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }


}
