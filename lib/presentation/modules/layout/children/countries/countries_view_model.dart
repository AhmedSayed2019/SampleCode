


import 'package:base_app/domain/entities/countries/countries_entity.dart';
import 'package:base_app/domain/usecase/common/get_countries_usecase.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../data/model/base/response_model.dart';
import '../../../../../../../domain/logger.dart';
import '../../../../../../core/utils/globals.dart';

class CountriesViewModel with ChangeNotifier {


  final GetCountriesUseCase _getCountriesUseCase ;

  CountriesViewModel({
    required GetCountriesUseCase getCountriesUseCase,
  })  :_getCountriesUseCase = getCountriesUseCase;

  ///variables
  ResponseModel<CountriesEntity>? _responseModel;
  int _currentPage = 1;

  bool _isLoading = false ;


  ///getters
  ResponseModel<CountriesEntity>? get responseModel => _responseModel;
  int get currentPage => _currentPage;
  bool get isLoading => _isLoading;


  ///colling api functions




  init() {
    if(kIsAuth && _responseModel?.data== null){
      _currentPage = 1;
      getCountries(false);

    }

  }

  //get countries
  Future<void> getCountries(bool reload, {int page = 1}) async {
    _isLoading = true;

    _currentPage = page;
    if (reload) {notifyListeners();}
    _responseModel = await _getCountriesUseCase.call(page: _currentPage);
    _isLoading = false;
    notifyListeners();
  }

  //get countries
  Future<void> getCountries1( bool reload, { bool isLoadMore = false}) async {
    _isLoading = true;

    if (!isLoadMore) {_responseModel = null;_currentPage=1;}
    else {notifyListeners();_currentPage = _currentPage + 1;}

    if (reload) {notifyListeners();_currentPage=1;}

    ResponseModel<CountriesEntity> responseModel = await _getCountriesUseCase.call(page: _currentPage);

    if (isLoadMore && _responseModel != null) {
      _responseModel?.data?.list.addAll(responseModel.data?.list ?? []);
    } else {
      _responseModel = responseModel;
    }

    _currentPage = responseModel.data?.pagination.currentPage??1;
    log('getCurrentCountries','${_responseModel?.data?.list.length}');
    _isLoading = false;
    notifyListeners();
  }



}
