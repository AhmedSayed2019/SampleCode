import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final int _id;
  final String _mainImage;
  final num _price;
  final num _priceAfterDiscount;
  final String _title;
  final num _averageRating;
  final num _completedSalesCount;
  final bool _recommended;

  @override
  List<Object> get props => [
        _id,
        _mainImage,
        _price,
        _priceAfterDiscount,
        _title,
        _averageRating,
        _completedSalesCount,
        _recommended,
      ];

  const ServiceEntity({
    required int id,
    required String mainImage,
    required num price,
    required num priceAfterDiscount,
    required String title,
    required num averageRating,
    required num completedSalesCount,
    required bool recommended,
  })  : _id = id,
        _mainImage = mainImage,
        _price = price,
        _priceAfterDiscount = priceAfterDiscount,
        _title = title,
        _averageRating = averageRating,
        _completedSalesCount = completedSalesCount,
        _recommended = recommended;

  bool get recommended => _recommended;

  num get completedSalesCount => _completedSalesCount;
  num get averageRating => _averageRating;
  String get title => _title;

  num get priceAfterDiscount => _priceAfterDiscount;

  num get price => _price;

  String get mainImage => _mainImage;

  int get id => _id;
}
