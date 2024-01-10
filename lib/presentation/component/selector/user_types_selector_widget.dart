import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/presentation/sheets/user_types_picker/user_types_picker_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/logger.dart';
import '../../../generated/locale_keys.g.dart';
import '../component.dart';


class UserTypesSelectorWidget extends StatelessWidget {
  final _tag = 'UserTypesSelectorWidget';
  final bool _isMultiChoice;
  final Function(DependencyEntity)? _onSelected;
  final Function(List<DependencyEntity>)? _onSelectList;
  final DependencyEntity? _selectedValue;
  final List<DependencyEntity>? _selectedList;
  final String? _error;
  final IconData? _iconData;
  final String? _iconSVG;
  final bool _isDark;

  const UserTypesSelectorWidget({super.key,
    bool isMultiChoice = false,
     Function(DependencyEntity)? onSelected,
     Function(List<DependencyEntity>)? onSelectList,
     DependencyEntity? selectedValue,
     List<DependencyEntity>? selectedList,
     String? error,
     IconData? iconData,
     String? iconSVG,
     bool isDark = false,
  })  : _isMultiChoice = isMultiChoice,
        _onSelected = onSelected,
        _onSelectList = onSelectList,
        _selectedValue = selectedValue,
        _selectedList = selectedList,
        _error = error,
        _iconData = iconData,
        _iconSVG = iconSVG,
        _isDark = isDark;

  @override
  Widget build(BuildContext context) {
    return CustomButtonArrow(
        isDark:_isDark,
        error: _error,
        value: _selectedValue?.name ?? ((_selectedList ?? []).isNotEmpty ? (_selectedList ?? []).map((e) => e.name).toList().join(' , ') :null),

        label: tr(LocaleKeys.userType),
        textColor: _selectedValue?.name == null
            ? Theme.of(context).hintColor
            : Theme.of(context).textTheme.bodySmall?.color,
        onTap: () => _onPressed(context));
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {

    var result = await showUserTypesPicker(
      context,
      isMultiChoice: _isMultiChoice,
      defaultList: _selectedList ?? [],
      defaultValue: _selectedValue,
    );

    log(_tag, 'onPressed: result= $result');
    FocusManager.instance.primaryFocus?.unfocus();

    if (result != null) {
      if (_isMultiChoice) {
        if (_onSelectList != null) {
          _onSelectList!(result);
        }
      } else {
        if (_onSelected != null) {
          _onSelected!(result);
        }
      }
    } else {
      log(_tag, 'result == null');
    }
  }
}
