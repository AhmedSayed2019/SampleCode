

import 'package:base_app/domain/entities/service_entity.dart';
import 'package:base_app/domain/repository/service_repo.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/service_model.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';

class GetPopularServicesUseCase  implements BaseUseCase<List<ServiceEntity>>{
  final ServiceRepository _repository;

  const GetPopularServicesUseCase({
    required ServiceRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<List<ServiceEntity>>> call() async =>
      BaseUseCaseCall.onGetData<List<ServiceEntity>>( await _repository.getPopularServices(), onConvert);

  @override
  ResponseModel<List<ServiceEntity>> onConvert(BaseModel baseModel) {
    List<ServiceEntity> list = [];
    baseModel.responseData.forEach((item) => list.add(ServiceModel.fromJson(item)));
    return ResponseModel(true, baseModel.message, data: list);
  }
}
