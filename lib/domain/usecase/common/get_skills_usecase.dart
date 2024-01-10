


import 'package:base_app/data/model/base/base_model.dart';
import 'package:base_app/data/model/response/dependency_model.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/repository/setting_repo.dart';
import 'package:base_app/domain/usecase/base_usecase/base_usecase.dart';

import '../../../data/model/base/response_model.dart';
import '../base_usecase/base_use_case_call.dart';




class GetSkillsUseCase  implements BaseUseCase<List<DependencyEntity>>{

  final SettingRepository _repository;

  const GetSkillsUseCase({
    required SettingRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<List<DependencyEntity>>> call() async =>
      BaseUseCaseCall.onGetData<List<DependencyEntity>>( await _repository.getDependencies(), onConvert,tag: 'GetDependenciesUseCase');

  
  @override
  ResponseModel<List<DependencyEntity>> onConvert(BaseModel baseModel) {
    List<DependencyEntity> list = [];

    baseModel.responseData['tags'].forEach((item) => list.add(DependencyModel.fromJson(item)));
    return ResponseModel(true, baseModel.message, data: list);
  }
}




