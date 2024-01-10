import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:equatable/equatable.dart';

class DependenciesEntity extends Equatable {
  final List<DependencyEntity> _skillsList;
  final List<DependencyEntity> _socialMediaList;


  @override
  List<Object> get props => [_skillsList, _socialMediaList];

  const DependenciesEntity({
    required List<DependencyEntity> skillsList,
    required List<DependencyEntity> socialMediaList,
  })  : _skillsList = skillsList,
        _socialMediaList = socialMediaList;

  List<DependencyEntity> get socialMediaList => _socialMediaList;

  List<DependencyEntity> get skillsList => _skillsList;
}
