import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/generated/assets.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/res/resources.dart';

class CustomNotifyMassageWidget extends StatelessWidget {
 final String _massage;

 const CustomNotifyMassageWidget({super.key,
   required String massage,
 }) : _massage = massage;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: const Color(0xffFFF9DC),
      child: Padding(
        padding:  EdgeInsets.all(kFormPaddingAllLarge.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconText(title: tr(LocaleKeys.notification), svgIcon: Assets.iconsNotifyMassageIcon,textStyle:const TextStyle().titleStyle(fontSize: 16).boldBlackStyle()),
            VerticalSpace(kFormPaddingAllLarge.h),
            Text(_massage,style: const TextStyle().regularStyle().colorBlack()),
          ],
        ),
      ),
    );
  }
}
