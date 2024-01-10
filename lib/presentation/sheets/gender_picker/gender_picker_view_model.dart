import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'dart:async';


import '../../../data/datasource/remote/exception/error_widget.dart';
import '../../../data/model/base/response_model.dart';
import '../../../domain/entities/drop_down_entity.dart';
import '../../../domain/logger.dart';
import '../../../generated/locale_keys.g.dart';

class GenderPickerViewModel extends ChangeNotifier{
  final _tag = 'GenderPickerViewModel';




  ///variables
  ResponseModel<List<DropDownEntity>>? _responseModel;
  DropDownEntity? _selected;
  List<DropDownEntity>? _selectedList = [];
  ErrorModel? _error;

  ///getters
  ErrorModel? get error => _error;
  ResponseModel<List<DropDownEntity>>? get responseModel => _responseModel;
  DropDownEntity? get selected => _selected;
  List<DropDownEntity>? get selectedList => _selectedList;

  init(DropDownEntity? defaultValue) {
    _selected = defaultValue;
  }

  Future<void> getList(BuildContext context, bool reload) async {
    _responseModel= null;
    if (reload) {notifyListeners();}
    if (_responseModel?.data!=null) {return;}

    _responseModel = ResponseModel(true, '', data: [
      DropDownEntity(id: 0, title: tr(LocaleKeys.male),key: 'male'),
      DropDownEntity(id: 1, title: tr(LocaleKeys.female),key: 'female')
    ]);

    notifyListeners();
  }

  void onItemChecked({required bool isChecked, required DropDownEntity selectedItem}) {
    log(_tag, 'onItemChecked: isChecked= $isChecked id= $selectedItem');
    if (isChecked) {
      log(_tag, 'onItemChecked: add');_selectedList!.add(selectedItem);
    } else {
      log(_tag, 'onItemChecked: remove');_selectedList!.removeWhere((item) => item.id == selectedItem.id);
    }
    _selectedList = [..._selectedList!];
    notifyListeners();
  }

  void onSelected(DropDownEntity value) {
    log(_tag, 'onSelected: $value');

    _selected = value;
    notifyListeners();
  }
}