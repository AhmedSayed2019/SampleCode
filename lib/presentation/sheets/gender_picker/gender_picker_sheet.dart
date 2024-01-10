import 'package:base_app/presentation/sheets/gender_picker/gender_picker_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:base_app/core/res/text_styles.dart';
import 'package:provider/provider.dart';


import '../../../core/res/values_manager.dart';
import '../../../data/model/base/response_model.dart';
import '../../../domain/entities/drop_down_entity.dart';
import '../../../domain/logger.dart';
import '../../../generated/locale_keys.g.dart';
import '../../component/component.dart';

class GenderPickerSheet extends StatefulWidget {
  final DropDownEntity? _defaultValue;
  const GenderPickerSheet({super.key,
    required DropDownEntity? defaultValue,
  })  :
        _defaultValue = defaultValue;

  @override
  State<GenderPickerSheet> createState() => _GenderPickerSheetState();
}

class _GenderPickerSheetState extends State<GenderPickerSheet> {
  final tag = 'GenderPickerSheet';
  late GenderPickerViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = Provider.of<GenderPickerViewModel>(context, listen: false);
    _viewModel.init(widget._defaultValue) ;
    _viewModel.getList(context,false);

  }

  @override
  Widget build(BuildContext context) {
    ResponseModel<List<DropDownEntity>>? responseModel = context.watch<GenderPickerViewModel>().responseModel;
    List<DropDownEntity>? selectedList = context.watch<GenderPickerViewModel>().selectedList;
    DropDownEntity? selected = context.watch<GenderPickerViewModel>().selected;
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(bottom: 32, top: 4),
      decoration:  BoxDecoration(borderRadius:const BorderRadius.vertical(top: Radius.circular(20)), color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomSheetHeader(
              title: tr(LocaleKeys.gender),
              onCancelPress: () => Navigator.pop(context),
            ),
            const Divider(height: 8),
            ScreenStateLayout(
              isLoading: responseModel == null,
              error:  responseModel?.error,
              isEmpty: ( responseModel?.data?.length??0)==0,
              onRetry: () => _viewModel.getList(context,true),
              builder: (context) =>
                  _buildBody(
                      context,
                      selectedItemIds: selectedList!.map((e) => e.id).toList(),
                      list: responseModel?.data??[],
                      selectedItem: selected
                  ),
            ),
            const VerticalSpace(kScreenPaddingNormal),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
              child: CustomButton(title: tr(LocaleKeys.submit),onTap: () => Navigator.pop(context,selected)
              ),
            )
          ]),
    );
  }

  Widget _buildBody(BuildContext context, {List<int?>? selectedItemIds, required List<DropDownEntity> list, DropDownEntity? selectedItem}) {
    return list.isEmpty ? const SizedBox.shrink() : Container(
      constraints: BoxConstraints(maxHeight: deviceHeight / 2,),
      child: ListView(shrinkWrap: true, children: list.map((e) => _buildSingleChoiceItem(context, selectedItem, e)).toList()),

    );
  }


  Widget _buildSingleChoiceItem(BuildContext context, DropDownEntity? selectedItem, DropDownEntity entity) {
    return RadioListTile<int>(
      groupValue: selectedItem?.id,
      title: Text(entity.title, style: const TextStyle().regularStyle().colorBlack()),
      value: entity.id,
      onChanged: (value) {
        log(tag, 'on item selected');
        _viewModel.onSelected(entity);
      },
    );
  }
}

Future<dynamic> showGenderPicker(BuildContext context,
    {
    required DropDownEntity? defaultValue}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
        child: GenderPickerSheet(
      defaultValue: defaultValue,
    )),
  );
}
