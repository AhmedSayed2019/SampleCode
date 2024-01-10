import 'package:base_app/data/model/response/countries/country_model.dart';
import 'package:base_app/data/model/response/pagination_model.dart';
import 'package:base_app/domain/entities/countries/countries_entity.dart';

class CountriesModel extends CountriesEntity {

  const CountriesModel({
    required List<CountryModel> list,
    required PaginationModel pagination,
  }) : super(list: list, pagination: pagination);

  factory CountriesModel.fromJson(Map<String, dynamic>? json) => CountriesModel(
        pagination:PaginationModel.fromJson(json?["pagination"]) ,
        list: List<CountryModel>.from((json?["data"]??[]).map((x) => CountryModel.fromJson(x))),
      );

}
