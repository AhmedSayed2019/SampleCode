import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/res/resources.dart';


class SkillsSelectorView extends StatefulWidget {
  final bool _isMultipleSelection;
  final List<DependencyEntity> _selected;
  final List<DependencyEntity> _list;
  final String? _error;
  final Function(DependencyEntity, bool)? _onSelected;

  SkillsSelectorView({
    super.key,
    bool isMultipleSelection = true,
    bool canBeNull = true,
    required List<DependencyEntity>? list,
    List<DependencyEntity>? selected,
    String? error,
    Function(DependencyEntity, bool)? onSelected,
  })  : _isMultipleSelection = isMultipleSelection,
        _list = list ?? [],
        _selected = selected ?? [],
        _error = error,
        _onSelected = onSelected
  ;

  @override
  State<SkillsSelectorView> createState() => _SkillsSelectorViewState();
}

class _SkillsSelectorViewState extends State<SkillsSelectorView> {
  late List<DependencyEntity> _selected;

  @override
  void initState() {
    _selected = widget._selected;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  widget._list.isEmpty?const SizedBox(): Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(tr(LocaleKeys.skills),style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r)),
            VerticalSpace(kFormPaddingAllLarge.h),
            CustomCard(
              color: Theme.of(context).highlightColor,
              child: Container(
                width: deviceWidth,

                padding: EdgeInsets.all(kFormPaddingAllSmall.w),
                child: Wrap(
                  spacing: 5.0,
                  children:  widget._list.map((tag) => _getChip(context,tag)).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _getChip(BuildContext context,DependencyEntity entity) {
    bool isSelected = _selected.where((element) => element.id == entity.id).isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
      child: FilterChip(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall))),
        selected: isSelected,
        backgroundColor:Theme.of(context).hoverColor,
        selectedColor: const Color(0xffE9F9F1),
        disabledColor: Theme.of(context).hintColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entity.name, style: const TextStyle().semiBoldStyle(fontSize: 12).customColor( isSelected?Theme.of(context).primaryColor:Colors.black)),
            HorizontalSpace(kFormPaddingAllSmall.w),
            Container(
              width: 20.r,
              height: 20.r,
              decoration:const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(isSelected ? Icons.close : Icons.done, size: 16.r,color: isSelected?Theme.of(context).primaryColor:Colors.black),
            ),
          ],
        ),
        // label: Center(child: Text(children.title, style: const TextStyle().descriptionStyle().customColor(isSelected ? Colors.white : Colors.black)),),
        elevation: 1,
        showCheckmark: false,
        onSelected: (bool value) {
          setState(() {
            if (widget._isMultipleSelection) {
              if (value) {_selected.add(entity);widget._onSelected!(entity, true);}
              else {_selected.remove(entity);widget._onSelected!(entity, false);}
            } else {_selected.clear();_selected.add(entity);widget._onSelected!(entity, value);}

          });
        },
      ),
    );
  }

}
