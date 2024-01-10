
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../generated/assets.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/component.dart';

class SocialMediaLoginWidget extends StatelessWidget {
  final VoidCallback? _loginByFacebook;
  final VoidCallback? _loginByGoogle;
  final VoidCallback? _loginByApple;
  final bool _loginWithFaceBook;
  final bool _loginWithGoogle;
  final bool _loginWithApple;


  const SocialMediaLoginWidget({super.key,
     GestureTapCallback? loginByFacebook,
     GestureTapCallback? loginByGoogle,
     GestureTapCallback? loginByApple,
     bool loginWithFaceBook=true,
     bool loginWithGoogle=true,
     bool loginWithApple=true,
  })  : _loginByFacebook = loginByFacebook,
        _loginByGoogle = loginByGoogle,
        _loginByApple = loginByApple,
        _loginWithFaceBook = loginWithFaceBook,
        _loginWithGoogle = loginWithGoogle,
        _loginWithApple = loginWithApple;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Padding(
        //   padding:  EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge.w),
        //   child: Row(
        //     children: [
        //       Expanded(child: Container(height: 2,color: Theme.of(context).highlightColor,)),
        //       HorizontalSpace( kFormPaddingAllLarge.w),
        //       Text(tr(LocaleKeys.or), style: const TextStyle().regularStyle().boldStyle().colorHint()),
        //       HorizontalSpace( kFormPaddingAllLarge.w),
        //       Expanded(child: Container(height: 2,color: Theme.of(context).highlightColor,)),
        //
        //     ],
        //   ),
        // ),
        // VerticalSpace( kFormPaddingAllLarge.h),
        Column(
          children: [
            if (_loginWithFaceBook) ...[
              VerticalSpace( kFormPaddingAllSmall.h),
              _buildFacebookIcon(context),
              VerticalSpace( kFormPaddingAllSmall.h),
            ],
            if (_loginWithApple /*&& Platform.isIOS*/) ...[
              VerticalSpace( kFormPaddingAllSmall.h),
              _buildAppleIcon(context),
              VerticalSpace( kFormPaddingAllSmall.h),
            ],
            if (_loginWithGoogle) ...[
              VerticalSpace( kFormPaddingAllSmall.h),
              _buildGoogleIcon(context),
              VerticalSpace( kFormPaddingAllSmall.h),
            ],



            // Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //
            //       if (_loginWithGoogle) ...[
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //         _buildGoogleIcon(context),
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //       ],
            //       if (_loginWithFaceBook) ...[
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //         _buildFacebookIcon(context),
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //       ],
            //
            //       if (_loginWithApple /*&& Platform.isIOS*/) ...[
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //         _buildAppleIcon(context),
            //         HorizontalSpace( kFormPaddingAllSmall.w),
            //       ]
            //     ]),
          ],
        )
      ],
    );
  }

  Widget _buildFacebookIcon(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onTap: () => _loginByFacebook!(),
      child: Row(
        children: [
          HorizontalSpace(50.w),
          CustomIconText(
              textStyle: const TextStyle().regularStyle(fontSize: 16),
              title: tr(LocaleKeys.signInWithFacebook),
              svgIcon: Assets.iconsFacebookIcon),
        ],
      ),
    );
    // return FloatingActionButton(
    //   onPressed: _loginByFacebook,
    //   elevation: 0,
    //   backgroundColor: Theme.of(context).highlightColor,
    //   child: SvgPicture.asset(Assets.iconsFacebookIcon),
    // );
  }

  Widget _buildAppleIcon(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onTap: () => _loginByApple!(),
      child: Row(
        children: [
          HorizontalSpace(50.w),
          CustomIconText(
              textStyle: const TextStyle().regularStyle(fontSize: 16),
              title: tr(LocaleKeys.signInWithApple),
              svgIcon: Assets.iconsAppleIcon),
        ],
      ),
    );
    // return FloatingActionButton(
    //   onPressed: _loginByApple,
    //   elevation: 0,
    //   backgroundColor: Theme.of(context).highlightColor,
    //   child: SvgPicture.asset(Assets.iconsAppleIcon),
    // );


  }

  Widget _buildGoogleIcon(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onTap: () => _loginByGoogle!(),
      child: Row(
        children: [
          HorizontalSpace(50.w),

          CustomIconText(
              textStyle: const TextStyle().regularStyle(fontSize: 16),
              title: tr(LocaleKeys.signInWithGoogle),
              svgIcon: Assets.iconsGoogleIcon),
        ],
      ),
    );
    // return FloatingActionButton(
    //   onPressed: _loginByGoogle,
    //   elevation: 0,
    //   backgroundColor: Theme.of(context).highlightColor,
    //   child: SvgPicture.asset(Assets.iconsGoogleIcon),
    // );


  }


}
