


import 'package:base_app/data/model/base/base_model.dart';
import 'package:base_app/data/model/response/dependencies_model.dart';
import 'package:base_app/data/model/response/dependency_model.dart';
import 'package:base_app/domain/entities/dependencies_entity.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/repository/setting_repo.dart';
import 'package:base_app/domain/usecase/base_usecase/base_usecase.dart';

import '../../../data/model/base/response_model.dart';
import '../base_usecase/base_use_case_call.dart';




class GetDependenciesUseCase  implements BaseUseCase<DependenciesEntity>{

  final SettingRepository _repository;

  const GetDependenciesUseCase({
    required SettingRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<DependenciesEntity>> call() async =>
      BaseUseCaseCall.onGetData<DependenciesEntity>( await _repository.getDependencies(), onConvert,tag: 'GetTagsUseCase');

  
  @override
  ResponseModel<DependenciesEntity> onConvert(BaseModel baseModel) {
    DependenciesEntity entity = DependenciesModel.fromJson(baseModel.responseData);
    return ResponseModel(true, baseModel.message, data: entity);
  }
}




