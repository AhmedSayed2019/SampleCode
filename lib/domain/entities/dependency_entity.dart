import 'package:equatable/equatable.dart';

class DependencyEntity extends Equatable {
  final String _id;
  final String _name;

  @override
  List<Object> get props => [_id, _name];

  const DependencyEntity({
    required String id,
    required String name,
  })  : _id = id,
        _name = name;

  String get name => _name;

  String get id => _id;
}
