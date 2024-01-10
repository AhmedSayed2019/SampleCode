


import 'package:base_app/data/model/base/api_response.dart';
import 'package:base_app/domain/parameters/auth/login_parameters.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';

mixin AuthRepository {
  Future<ApiResponse> login({required LoginParameters parameters}) ;
  Future<ApiResponse> register({required RegisterParameters parameters});

}
