import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/res/text_styles.dart';
import 'package:base_app/core/utils/social_media_icons_helper.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/presentation/component/animation/list_animator_data.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';

class SocialMediaView extends StatelessWidget {
  final List<DependencyEntity> _selected;
  final List<DependencyEntity> _list;
  final String? _error;
  final Function(DependencyEntity, bool) _onSelected;

  SocialMediaView({
    super.key,
    required List<DependencyEntity>? list,
    required List<DependencyEntity> selected,
    String? error,
    required Function(DependencyEntity, bool) onSelected,
  })  :
        _list = list ?? [],
        _selected = selected ,
        _error = error,
        _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(LocaleKeys.favouriteSocialMedia),style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r)),
        VerticalSpace(kFormPaddingAllLarge.h),
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall.r),),
              border: Border.all(color:_error!=null? Theme.of(context).errorColor: Theme.of(context).highlightColor)
          ),

          child: CustomListAnimatorData(
            itemCount: _list.length,
            verticalSpace: 0,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _buildItem( _list[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(DependencyEntity entity) {
   String? icon = SocialMediaIconsHelper.getIcon(entity.id);
    return Row(
      children: [
        Checkbox(
          // contentPadding: EdgeInsets.zero,
          value: _selected.map((e) => e.id).toList().contains(entity.id),
          onChanged: (b) => _onSelected(entity,b!),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        SizedBox(width: 24.r,height: 24.r,child:icon==null?null: CustomSVGIcon(icon)),
        HorizontalSpace(kFormPaddingAllLarge.w),
        Text(entity.name, style: const TextStyle().regularStyle().colorBlack())
      ],
    );
  }
}
