
import '../../../data/model/base/response_model.dart';
import '../../repository/local_repo.dart';

class GetUserTokenUseCase {
  // final _tag = 'GetUserTokenDataUseCase';
  final LocalRepository _repository;

  GetUserTokenUseCase({
    required LocalRepository repository,
  }) : _repository = repository;
  Future<ResponseModel> call() async {
    String token =await _repository.getUserToken();

    if (token.isNotEmpty) {
      return ResponseModel(true, 'successful', data: token);
    } else {
      return ResponseModel(false, 'error');
    }
  }

}
