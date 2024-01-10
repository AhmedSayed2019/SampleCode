


import 'package:base_app/data/model/base/base_model.dart';
import 'package:base_app/domain/entities/countries/countries_entity.dart';
import 'package:base_app/domain/repository/setting_repo.dart';
import 'package:base_app/domain/usecase/base_usecase/base_usecase.dart';

import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/countries/countries_model.dart';
import '../base_usecase/base_use_case_call.dart';




class GetCountriesUseCase  implements BaseUseCase<CountriesEntity>{

  final SettingRepository _repository;

  const GetCountriesUseCase({
    required SettingRepository repository,
  }) : _repository = repository;

  Future<ResponseModel<CountriesEntity>> call({required int page}) async =>
      BaseUseCaseCall.onGetData<CountriesEntity>( await _repository.getCountries(page: page), onConvert,tag: 'GetTagsUseCase');

  
  @override
  ResponseModel<CountriesEntity> onConvert(BaseModel baseModel) {
    CountriesEntity entity = CountriesModel.fromJson(baseModel.response);
    return ResponseModel(true, baseModel.message, data: entity);
  }
}




