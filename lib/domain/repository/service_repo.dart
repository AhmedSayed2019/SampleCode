





import 'package:base_app/data/model/base/api_response.dart';

abstract class ServiceRepository {

  Future<ApiResponse> getServices();
  Future<ApiResponse> getPopularServices();

}
