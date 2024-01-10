import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int _id;
  final String _countryCode;
  final String _name;
  final String _capital;

  @override
  List<Object> get props => [_id, _name, _capital, _countryCode];

  const CountryEntity({
    required int id,
    required String countryCode,
    required String name,
    required String capital,
  })  : _id = id,
        _countryCode = countryCode,
        _name = name,
        _capital = capital;

  String get capital => _capital;
  String get name => _name;
  String get countryCode => _countryCode;
  int get id => _id;
}
