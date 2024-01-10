import 'package:base_app/domain/entities/dependency_entity.dart';

class DependencyModel extends DependencyEntity {
  const DependencyModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory DependencyModel.fromJson(Map<String, dynamic>? json) =>
      DependencyModel(
        id: (json?["value"] ??json?["code"] ?? -1).toString(),
        name: json?["label"] ??json?["name"] ?? '',
      );
}
