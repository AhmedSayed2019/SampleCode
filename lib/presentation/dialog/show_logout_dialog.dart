

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/navigation_services.dart';
import '../../../generated/locale_keys.g.dart';
import '../../core/routing/routes.dart';
import '../../domain/provider/local_auth_provider.dart';
import '../component/component.dart';
import 'base/simple_dialogs.dart';



class _LogoutDialog extends StatefulWidget {
  const _LogoutDialog({Key? key}) : super(key: key);

  @override
  State<_LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<_LogoutDialog> {
  bool _isLoading = false ;
  _onLogoutPress(BuildContext context) {
    setState(() {_isLoading = true;});
    Provider.of<LocalAuthProvider>(context, listen: false).logOut().then((isCleared) {
      setState(() {_isLoading = false;});
      NavigationService.goBack();
      NavigationService.pushNamedAndRemoveUntil(Routes.authScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(kScreenPaddingNormal.r),
          child: Column(
            children: [
              Text(tr(LocaleKeys.logout),style:const TextStyle().titleStyle(fontSize: 16).colorBlack(),textAlign: TextAlign.center,),
              VerticalSpace(kScreenPaddingNormal.h),
              Text(tr(LocaleKeys.wantToSignOut),style:const TextStyle().regularStyle(fontSize: 14).colorHint(),textAlign: TextAlign.center,),
              VerticalSpace(kScreenPaddingNormal.h),
              if(_isLoading) CustomLoadingSpinner(size: 28.r)else
              Row(
                children: [
                  Expanded(child: CustomButton(onTap: ()=> NavigationService.goBack(),title: tr(LocaleKeys.cancel),color: Theme.of(context).hintColor,height: 40,)),
                  HorizontalSpace(kFormPaddingAllLarge.h),
                  Expanded(child: CustomButton(onTap: ()=> _onLogoutPress(context) ,title: tr(LocaleKeys.logout),height: 40)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}




Future showCustomDialogLogout(BuildContext context,) async =>
    showCustomDialog(context, const _LogoutDialog(), onDismissCallback: ()=>NavigationService.goBack() ,isCancellable: true);
