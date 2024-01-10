import 'package:base_app/core/res/resources.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/presentation/sheets/skills_picker/skills_picker_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../component/component.dart';

class _SkillsPickerSheet extends StatefulWidget {
  final List<DependencyEntity> _defaultList;
  const _SkillsPickerSheet({
    required List<DependencyEntity> defaultList,
  })  : _defaultList = defaultList;

  @override
  State<_SkillsPickerSheet> createState() => __SkillsPickerSheetState();


}

class __SkillsPickerSheetState extends State<_SkillsPickerSheet> {
  late SkillsPickerViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = Provider.of<SkillsPickerViewModel>(context, listen: false);
    _viewModel.initVieModel(context,widget._defaultList) ;

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SkillsPickerViewModel>(
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
                CustomSheetHeader(title: tr(LocaleKeys.skills), onCancelPress: () => Navigator.pop(context)),
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
                        ),
                ),
                const VerticalSpace(kScreenPaddingNormal),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
                  child: CustomButton(title: tr(LocaleKeys.submit),onTap: () => Navigator.pop(context, provider.selectedList )),
                )
              ]),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, {List<String?>? selectedItemIds, required List<DependencyEntity> model}) {
    return model.isEmpty
        ? const SizedBox.shrink()
        : Container(
            constraints: BoxConstraints(maxHeight: deviceHeight / 2),
            child: ListView(shrinkWrap: true, children: model.map((e) =>  _buildMultiChoiceItem(context, selectedItemIds, e)).toList()),
          );
  }

  Widget _buildMultiChoiceItem(BuildContext context, List<String?>? selectedDependencyIds, DependencyEntity model) {
    return CheckboxListTile(
      value: selectedDependencyIds!.contains(model.id),
      onChanged: (b) => _viewModel.onItemChecked(isChecked: b!, selectedItem: model),
      title: Text(model.name, style: const TextStyle().regularStyle().colorBlack()),
    );
  }


}

Future<dynamic> showSkillsPicker(BuildContext context, {required List<DependencyEntity> defaultList}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
        child: _SkillsPickerSheet(
      defaultList: defaultList,
    )),
  );
}
