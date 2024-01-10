import 'package:base_app/domain/entities/service_entity.dart';




class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required int id,
    required String mainImage,
    required num price,
    required num priceAfterDiscount,
    required String title,
    required num averageRating,
    required num completedSalesCount,
    required bool recommended,
  }) : super(
            id: id,
            mainImage: mainImage,
            price: price,
            priceAfterDiscount: priceAfterDiscount,
            title: title,
            averageRating: averageRating,
            completedSalesCount: completedSalesCount,
            recommended: recommended);

  factory ServiceModel.fromJson(Map<String, dynamic>? json) => ServiceModel(
    id: json?["id"]??0,
    mainImage: json?["main_image"]??'',
    price: json?["price"]??0,
    priceAfterDiscount: json?["price_after_discount"],
    title: json?["title"]??'',
    averageRating: json?["average_rating"]??0,
    completedSalesCount: json?["completed_sales_count"]??0,
    recommended: json?["recommended"]??false,

      );
}
