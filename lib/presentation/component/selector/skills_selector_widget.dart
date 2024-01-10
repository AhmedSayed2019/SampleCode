import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/presentation/sheets/skills_picker/skills_picker_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/logger.dart';
import '../../../generated/locale_keys.g.dart';
import '../component.dart';


class SkillsSelectorWidget extends StatefulWidget {
  final Function(List<DependencyEntity>)? _onSelectList;
  final List<DependencyEntity>? _selectedList;
  final String? _error;


  const SkillsSelectorWidget({super.key,
     Function(List<DependencyEntity>)? onSelectList,
     List<DependencyEntity>? selectedList,
     String? error,
  })  :
        _onSelectList = onSelectList,
        _selectedList = selectedList,
        _error = error;

  @override
  State<SkillsSelectorWidget> createState() => _SkillsSelectorWidgetState();
}

class _SkillsSelectorWidgetState extends State<SkillsSelectorWidget> {
  final _tag = 'SkillsSelectorWidget';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( tr(LocaleKeys.skills),style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r)),
        VerticalSpace(kFormPaddingAllLarge.h),
        GestureDetector(
          onTap: ()=>_onPressed(context),
          child: Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall.r),),
                border: Border.all(color:widget._error!=null? Theme.of(context).errorColor: Theme.of(context).highlightColor)
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 2.0,
                    children: (widget._selectedList??[]).map((tag) => _getChip(context,tag)).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kFormPaddingAllSmall.r),
                  child: const Icon(Icons.keyboard_arrow_down_rounded),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getChip(BuildContext context,DependencyEntity entity) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
      child: FilterChip(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall))),
        selected: true,
        backgroundColor:Theme.of(context).hoverColor,
        selectedColor: const Color(0xffE9F9F1),
        disabledColor: Theme.of(context).hintColor,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entity.name, style: const TextStyle().semiBoldStyle(fontSize: 12).customColor( Theme.of(context).primaryColor)),
            HorizontalSpace(kFormPaddingAllSmall.w),
            Container(
              width: 20.r,
              height: 20.r,
              decoration:const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon( Icons.close, size: 16.r,color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        elevation: 0,
        showCheckmark: false,
        onSelected: (bool value) {
          setState(() {
           widget._selectedList!.removeWhere((element) => element.id == entity.id);widget._onSelectList!(widget._selectedList!);
          });

        },
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    var result = await showSkillsPicker(context, defaultList: widget._selectedList ?? []);
    log(_tag, 'onPressed: result= $result');
    FocusManager.instance.primaryFocus?.unfocus();

    if (result != null) {
      if (widget._onSelectList != null) {
        widget._onSelectList!(result);
      }
    } else {
      log(_tag, 'result == null');
    }
  }
}
