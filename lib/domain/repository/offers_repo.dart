


import 'package:base_app/data/model/base/api_response.dart';
import 'package:base_app/domain/parameters/offer_filter_parameters.dart';

abstract class OfferRepository {

  Future<ApiResponse> getOffers({required OffersFilterParameters parameters});
  Future<ApiResponse> getSavedOffers();
  Future<ApiResponse> getOfferDetails({required int offerId});
  Future<ApiResponse> saveOffer({required int offerId,required bool isSave});



}
