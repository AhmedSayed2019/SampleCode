import 'package:base_app/domain/entities/countries/country_entity.dart';
import 'package:base_app/domain/entities/pagination_entity.dart';
import 'package:equatable/equatable.dart';

class CountriesEntity extends Equatable {
  final List<CountryEntity> _list;
  final PaginationEntity _pagination;


  @override
  List<Object> get props => [_list, _pagination];


  const CountriesEntity({
    required List<CountryEntity> list,
    required PaginationEntity pagination,
  })  : _list = list,
        _pagination = pagination;

  PaginationEntity get pagination => _pagination;
  List<CountryEntity> get list => _list;
}
