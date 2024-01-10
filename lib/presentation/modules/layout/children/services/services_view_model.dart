

import 'package:base_app/domain/entities/service_entity.dart';
import 'package:base_app/domain/usecase/service/get_popular_services_usecase.dart';
import 'package:base_app/domain/usecase/service/get_services_usecase.dart';

import 'package:flutter/widgets.dart';

import '../../../../../../../data/model/base/response_model.dart';


class ServicesViewModel with ChangeNotifier {


  final GetServicesUseCase _getServicesUseCase ;
  final GetPopularServicesUseCase _getPopularServicesUseCase ;

  ServicesViewModel({
    required GetServicesUseCase getServicesUseCase,
    required GetPopularServicesUseCase getPopularServicesUseCase,
  })  : _getServicesUseCase = getServicesUseCase,
        _getPopularServicesUseCase = getPopularServicesUseCase;

  ///variables
  ResponseModel<List<ServiceEntity>>? _responseModel;
  ResponseModel<List<ServiceEntity>>? _popularResponseModel;


  ///getters
  ResponseModel<List<ServiceEntity>>? get responseModel => _responseModel;
  ResponseModel<List<ServiceEntity>>? get popularResponseModel => _popularResponseModel;


  getData( {  bool reload = false}){
    if(reload == false && (_responseModel?.data??[]).isNotEmpty&& (_popularResponseModel?.data??[]).isNotEmpty){
      return;
    }
    getServices(reload: reload);
    getPopularServices(reload: reload);
  }


  ///colling api functions

  //Get Services
  Future<void> getServices( {  bool reload = false}) async {
    _responseModel = null;
    if(reload){notifyListeners();}
    _responseModel = await _getServicesUseCase.call();
    notifyListeners();
  }

  //Get Popular Services
  Future<void> getPopularServices( {  bool reload = false}) async {
    _popularResponseModel = null;
    if(reload){notifyListeners();}
    _popularResponseModel = await _getPopularServicesUseCase.call();
    notifyListeners();
  }

}
