import 'package:base_app/core/res/resources.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/presentation/sheets/user_types_picker/user_types_picker_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../component/component.dart';

class _DependencyPickerSheet extends StatefulWidget {
  final List<DependencyEntity> _defaultList;
  final DependencyEntity? _defaultValue;
  final bool _isMultiChoice;
  const _DependencyPickerSheet({required List<DependencyEntity> defaultList,
    required DependencyEntity? defaultValue,
    required bool isMultiChoice,
  })  : _defaultList = defaultList,
        _defaultValue = defaultValue,
        _isMultiChoice = isMultiChoice
  ;

  @override
  State<_DependencyPickerSheet> createState() => __DependencyPickerSheetState();


}

class __DependencyPickerSheetState extends State<_DependencyPickerSheet> {
  late UserTypesPickerViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = Provider.of<UserTypesPickerViewModel>(context, listen: false);
    _viewModel.initVieModel(context,defaultValue: widget._defaultValue,) ;

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserTypesPickerViewModel>(
      builder: (context, provider, child) {
        _viewModel = provider;
        return Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.only(bottom: 32, top: 4),
          decoration:  BoxDecoration(borderRadius:const BorderRadius.vertical(top: Radius.circular(20)), color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomSheetHeader(
                  title: tr(LocaleKeys.userType),
                  onCancelPress: () => Navigator.pop(context),
                ),
                const Divider(height: 8),
                ScreenStateLayout(
                  isLoading: provider.responseModel == null,
                  error:  provider.responseModel?.error,
                  isEmpty: ( provider.responseModel?.data?.length??0)==0,
                  onRetry: () => _viewModel.getList(context,reload: true),
                  builder: (context) =>
                      _buildBody(
                            context,
                            selectedItemIds: provider.selectedList!.map((e) => e.id).toList(),
                            model: provider.responseModel?.data??[],
                            selectedItem: provider.selected
                        ),
                ),
                const VerticalSpace(kScreenPaddingNormal),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
                  child: CustomButton(title: tr(LocaleKeys.submit),onTap: () => Navigator.pop(context, widget._isMultiChoice ? provider.selectedList : provider.selected)),
                )
              ]),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, {List<String?>? selectedItemIds, required List<DependencyEntity> model, DependencyEntity? selectedItem}) {
    return model.isEmpty
        ? const SizedBox.shrink()
        : Container(
            constraints: BoxConstraints(maxHeight: deviceHeight / 2),
            child: ListView(
                shrinkWrap: true,
                children: model
                    .map((e) => widget._isMultiChoice
                        ? _buildMultiChoiceItem(context, selectedItemIds, e)
                        : _buildSingleChoiceItem(context, selectedItem, e))
                    .toList()),
          );
  }

  Widget _buildMultiChoiceItem(BuildContext context, List<String?>? selectedDependencyIds, DependencyEntity entity) {
    return CheckboxListTile(
      value: selectedDependencyIds!.contains(entity.id),
      onChanged: (b) => _viewModel.onItemChecked(isChecked: b!, selectedItem: entity),
      title: Text(tr(entity.name), style: const TextStyle().regularStyle().colorBlack()),
    );
  }


  Widget _buildSingleChoiceItem(BuildContext context, DependencyEntity? selectedItem, DependencyEntity entity) {
    return RadioListTile<String>(
      groupValue: selectedItem?.id,
      title: Text(tr(entity.name), style: const TextStyle().regularStyle().colorBlack()),
      value: entity.id,
      onChanged: (value) =>
        _viewModel.onSelected(entity)
      ,
    );
  }
}

Future<dynamic> showUserTypesPicker(BuildContext context,
    {required List<DependencyEntity> defaultList,
    required DependencyEntity? defaultValue,
    required bool isMultiChoice}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
        child: _DependencyPickerSheet(
      defaultList: defaultList,
      defaultValue: defaultValue,
      isMultiChoice: isMultiChoice,
    )),
  );
}
