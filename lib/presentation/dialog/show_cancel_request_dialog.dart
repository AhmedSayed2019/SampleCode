

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/res/resources.dart';
import '../../core/routing/navigation_services.dart';
import '../../generated/locale_keys.g.dart';
import '../component/component.dart';
import 'base/simple_dialogs.dart';

Future showDeleteDialog(BuildContext context,{required String title ,required Function onDeletePressed}) async =>
  showCustomDialog(context, _buildBody(context,title: title,onDeletePressed: onDeletePressed), onDismissCallback: onDeletePressed ,isCancellable: true);

_buildBody(BuildContext context,{required String title ,required Function onDeletePressed}){
  return Column(
    children: [
      Padding(
       padding: EdgeInsets.all(kScreenPaddingNormal.r),
        child: Column(
          children: [

            Text(title,style:const TextStyle().titleStyle(fontSize: 16).colorBlack(),textAlign: TextAlign.center,),
            VerticalSpace(kScreenPaddingNormal.h),
            Text(tr(LocaleKeys.deleteMassage),style:const TextStyle().regularStyle(fontSize: 14).colorHint(),textAlign: TextAlign.center,),
            VerticalSpace(kScreenPaddingNormal.h),
            Row(
              children: [
                Expanded(child: CustomButton(onTap: (){NavigationService.goBack();onDeletePressed();},title: tr(LocaleKeys.delete),height: 40,/*,isOutlined: true,textColor: Theme.of(context).primaryColor*/)),


                HorizontalSpace(kFormPaddingAllLarge.h),
                Expanded(child: CustomButton(onTap: ()=>NavigationService.goBack(),title: tr(LocaleKeys.cancel),color: Theme.of(context).hintColor,height: 40,)),

              ],
            ),
          ],
        ),
      ),
    ],
  );
}
