import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/routing/navigation_services.dart';
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/core/utils/launch_links_and_apps/launch_links_and_apps_helper.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../generated/assets.dart';
import '../../../component/component.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  Assets.svgKafillLogo,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
            ),

            /*            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  Assets.svgLogoWithSmallText,
                  fit: BoxFit.fill,
                  width: 245.92.w,
                  height: 120.h,
                ),
              ),
            ),*/
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top:Radius.circular( kFormRadiusLarge.r))).customColor(Colors.white)),
                  // Image.asset(
                  //   Assets.imagesAuthBackground,
                  //   fit: BoxFit.fill,
                  //   width: deviceWidth,
                  //   height: deviceHeight,
                  // ),

                  Padding(
                    padding: kScreenPadding,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tr(LocaleKeys.helloThere),style: const TextStyle().titleStyle(fontSize: 24),),
                              VerticalSpace(kFormPaddingAllLarge.h),
                              Text('Created By Ahmed Sayed',style: const TextStyle().semiBoldStyle()),
                              VerticalSpace(kFormPaddingAllLarge.h),
                              GestureDetector(onTap:()=> LaunchHelper.link(link: 'https://ahmedsayed2019.github.io/'),child: Text('Portfolio',style: const TextStyle().semiBoldStyle().underLineStyle().activeColor())),

                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CustomButton(
                              title: tr(LocaleKeys.login),
                              onTap: () =>NavigationService.push(Routes.loginScreen),
                            ),
                            VerticalSpace(kFormPaddingAllLarge.h),
                            CustomButton(
                              color: Theme.of(context).cardColor,
                              textColor: Theme.of(context).textTheme.headline1?.color,
                              title: tr(LocaleKeys.register),
                              onTap: () =>NavigationService.push(Routes.registerScreen),
                            ),
                            VerticalSpace(kScreenPaddingNormal.h),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );  }
}
