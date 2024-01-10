import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';


class GenderSelectorWidget extends StatelessWidget {
  final _tag = 'GenderSelectorWidget';
  final Function(GenderEnum) _onSelected;
  final GenderEnum? _selectedValue;

  const GenderSelectorWidget({
    super.key,
    required Function(GenderEnum) onSelected,
    required GenderEnum? selectedValue,
  })  : _onSelected = onSelected,
        _selectedValue = selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(LocaleKeys.gender),style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r)),
        VerticalSpace(kFormPaddingAllLarge.h),

        // Expanded(child: Text(tr(LocaleKeys.gender), style: const TextStyle().regularStyle(fontSize: 15).colorHint())),
        Row(
          children: [
            Radio<GenderEnum>(
              value: GenderEnum.male,
              groupValue: _selectedValue, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (v) =>_onSelected(GenderEnum.male),
            ),
            Text(tr(LocaleKeys.male), style: const TextStyle().regularStyle().colorHint()),
            HorizontalSpace(kFormPaddingAllLarge.w),
            Radio<GenderEnum>(
              value: GenderEnum.female,

              groupValue: _selectedValue, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (v) =>_onSelected(GenderEnum.female),
            ),
            Text(tr(LocaleKeys.female), style: const TextStyle().regularStyle().colorHint()),
          ],
        ),
      ],
    );
  }
}
