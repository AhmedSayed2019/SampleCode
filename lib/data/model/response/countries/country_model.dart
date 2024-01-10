import 'package:base_app/domain/entities/countries/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required int id,
    required String countryCode,
    required String name,
    required String capital,
  }) : super(id: id, countryCode: countryCode, name: name, capital: capital);

  factory CountryModel.fromJson(Map<String, dynamic>? json) => CountryModel(
        id: json?["id"] ?? -1,
        countryCode: json?["country_code"] ?? -1,
        name: json?["name"] ?? '',
        capital: json?["capital"] ?? '',
      );
}
