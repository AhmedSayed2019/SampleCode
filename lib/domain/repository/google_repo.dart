

import 'package:base_app/data/model/base/api_response.dart';


abstract class GoogleRepository {

  Future<ApiResponse> searchForPlaces({required String input});
  Future<ApiResponse> getPlaceDetails({required String placeId});

}
