import 'package:base_app/data/model/response/dependency_model.dart';
import 'package:base_app/domain/entities/dependencies_entity.dart';

class DependenciesModel extends DependenciesEntity {
  const DependenciesModel({
    required List<DependencyModel> skillsList,
    required List<DependencyModel> socialMediaList,
  }) : super(socialMediaList: socialMediaList, skillsList: skillsList);

  factory DependenciesModel.fromJson(Map<String, dynamic>? json) =>
      DependenciesModel(
        skillsList: List<DependencyModel>.from(json?["tags"].map((x) => DependencyModel.fromJson(x))),
        socialMediaList: List<DependencyModel>.from(json?["social_media"].map((x) => DependencyModel.fromJson(x))),

      );
}
