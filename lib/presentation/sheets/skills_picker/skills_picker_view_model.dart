import 'dart:async';

import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/usecase/common/get_skills_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/base/response_model.dart';
import '../../../../../domain/logger.dart';
import '../../../../../data/datasource/remote/exception/error_widget.dart';

class SkillsPickerViewModel with ChangeNotifier {
  final tag = 'SkillsPickerViewModel';

  final GetSkillsUseCase _getSkillsUseCase;
  SkillsPickerViewModel({
    required GetSkillsUseCase getSkillsUseCase,
  }) : _getSkillsUseCase = getSkillsUseCase;


  ///variables
  ResponseModel<List<DependencyEntity>>? _responseModel;
  List<DependencyEntity>? _selectedList = [];
  ErrorModel? _error;

  ///getters
  ErrorModel? get error => _error;
  ResponseModel<List<DependencyEntity>>? get responseModel => _responseModel;
  List<DependencyEntity>? get selectedList => _selectedList;


  initVieModel(BuildContext context,List<DependencyEntity> selectedList) {
    _selectedList = selectedList;
    getList(context,reload:false);
  }

  Future<void> getList(BuildContext context,{required bool reload}) async {

    if (reload) {notifyListeners();}
    _responseModel = await _getSkillsUseCase.call();
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

}
