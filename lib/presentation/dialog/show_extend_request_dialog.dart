

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/res/resources.dart';
import '../../core/routing/navigation_services.dart';
import '../../generated/locale_keys.g.dart';
import '../component/component.dart';
import 'base/simple_dialogs.dart';

Future showExtendRequestDialog(BuildContext context,{required Function onDeletePressed}) async =>
  showCustomDialog(context, _buildBody(context,onDeletePressed: onDeletePressed), onDismissCallback: onDeletePressed ,isCancellable: true);

_buildBody(BuildContext context,{required Function onDeletePressed}){
  return Column(
    children: [
      Padding(
       padding: EdgeInsets.all(kScreenPaddingNormal.r),
        child: Column(
          children: [
            Text(tr(LocaleKeys.extendRequest),style:const TextStyle().titleStyle(fontSize: 16).colorBlack(),textAlign: TextAlign.center,),
            VerticalSpace(kScreenPaddingNormal.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: '${tr(LocaleKeys.youWillBeExtendingYourRequestFor)}\n' , style: const TextStyle().regularStyle().colorHint()),
                  TextSpan(text:  ' 14 ' , style: const TextStyle().titleStyle(fontSize: 14)),
                  TextSpan(text: tr(LocaleKeys.daysAreYouSureYouWantToContinue) , style: const TextStyle().regularStyle().colorHint()),

                ],
              ),
            ),
            VerticalSpace(kScreenPaddingNormal.h),
            Row(
              children: [

                Expanded(child: CustomButton(onTap: ()=>NavigationService.goBack(),title: tr(LocaleKeys.cancel),color: Theme.of(context).hintColor,height: 40,)),
                HorizontalSpace(kFormPaddingAllLarge.h),
                Expanded(child: CustomButton(onTap: (){NavigationService.goBack();onDeletePressed();},title: tr(LocaleKeys.accept),height: 40,/*,isOutlined: true,textColor: Theme.of(context).primaryColor*/)),

              ],
            ),
          ],
        ),
      ),
    ],
  );
}
