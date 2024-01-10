import 'dart:async';

import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/usecase/common/get_user_types_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/base/response_model.dart';
import '../../../../../domain/logger.dart';
import '../../../../../data/datasource/remote/exception/error_widget.dart';

class UserTypesPickerViewModel with ChangeNotifier {
  final tag = 'UserTypesPickerViewModel';

  final GetUserTypesUseCase _getUserTypesUseCase;
  UserTypesPickerViewModel({
    required GetUserTypesUseCase getUserTypesUseCase,
  }) : _getUserTypesUseCase = getUserTypesUseCase;




  ///variables
  ResponseModel<List<DependencyEntity>>? _responseModel;
  DependencyEntity? _selected;
  List<DependencyEntity>? _selectedList = [];
  ErrorModel? _error;

  ///getters
  ErrorModel? get error => _error;
  ResponseModel<List<DependencyEntity>>? get responseModel => _responseModel;
  DependencyEntity? get selected => _selected;
  List<DependencyEntity>? get selectedList => _selectedList;


  initVieModel(BuildContext context,{DependencyEntity? defaultValue, }) {
    getList(context,reload:false);
    _selected = defaultValue;
  }

  Future<void> getList(BuildContext context,{required bool reload}) async {

    if (reload) {notifyListeners();}
    _responseModel = await _getUserTypesUseCase.call();
    notifyListeners();
  }

  void onItemChecked({required bool isChecked, required DependencyEntity selectedItem}) {
    log(tag, 'onItemChecked: isChecked= $isChecked id= $selectedItem');
    if (isChecked) {
      log(tag, 'onItemChecked: add');_selectedList!.add(selectedItem);
    } else {
      log(tag, 'onItemChecked: remove');_selectedList!.removeWhere((item) => item.id == selectedItem.id);
    }
    _selectedList = [..._selectedList!];
    notifyListeners();
  }

  void onSelected(DependencyEntity value) {
    log(tag, 'onSelected: $value');

    _selected = value;
    notifyListeners();
  }
}
