import '../../../data/model/base/response_model.dart';
import '../../repository/local_repo.dart';




class ClearUserDataUseCase {
  // final _tag = 'UserSubCategoriesViewModel';
  final LocalRepository _repository;
  ClearUserDataUseCase({
    required LocalRepository repository,
  }) : _repository = repository;
  Future<ResponseModel> call() async {
    bool isCleared = await _repository.clearSharedData();

    if (isCleared) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
