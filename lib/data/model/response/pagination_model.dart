import 'package:base_app/domain/entities/pagination_entity.dart';

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required int count,
    required int total,
    required int perPage,
    required int currentPage,
    required int totalPages,
  }) : super(
            count: count,
            total: total,
            perPage: perPage,
            currentPage: currentPage,
            totalPages: totalPages);

  factory PaginationModel.fromJson(Map<String, dynamic>? json) =>
      PaginationModel(
        count: json?["count"] ?? 0,
        total: json?["total"] ?? 0,
        perPage: json?["perPage"] ?? 0,
        totalPages: json?["totalPages"] ?? 0,
        currentPage: json?["currentPage"] ?? 0,
      );
}
