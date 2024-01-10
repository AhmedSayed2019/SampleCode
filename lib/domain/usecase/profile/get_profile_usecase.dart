

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../entities/profile_entity.dart';
import '../../repository/profile_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';

class GetProfileUseCase  implements BaseUseCase<ProfileEntity>{
  final ProfileRepository _repository;

  const GetProfileUseCase({
    required ProfileRepository repository,
  }) : _repository = repository;

  Future<ResponseModel> call() async =>
      BaseUseCaseCall.onGetData<ProfileEntity>( await _repository.getProfile(), onConvert);

  @override
  ResponseModel<ProfileEntity> onConvert(BaseModel baseModel) {
    ProfileEntity? user ;
    if (baseModel.responseData != null) { user = ProfileModel.fromJson(baseModel.responseData);}
    return ResponseModel(true, baseModel.message, data: user);
  }
}
