



import '../../data/model/base/api_response.dart';

abstract class SettingRepository {

  Future<ApiResponse> getDependencies();
  Future<ApiResponse> getCountries({required int page});




}
