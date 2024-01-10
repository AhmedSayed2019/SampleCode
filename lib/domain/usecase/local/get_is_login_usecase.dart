
import '../../../data/model/base/response_model.dart';
import '../../repository/local_repo.dart';

class IsUserLoginUseCase {
  // final _tag = 'IsUserLoginUseCase';
  final LocalRepository _repository;
  IsUserLoginUseCase({
    required LocalRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call() async {
    bool isLogin =  _repository.isLoggedIn();

    if (isLogin) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }


}
