


import '../../data/model/base/api_response.dart';

abstract class HomeRepository {

  Future<ApiResponse> getCustomerHome();
  Future<ApiResponse> getContractorHome();


}
