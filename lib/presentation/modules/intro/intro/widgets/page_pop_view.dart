import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../component/component.dart';
import '../intro_screen.dart';




class PagePopup extends StatelessWidget {
  final PageViewData _pageViewData;

  const PagePopup({super.key,
    required PageViewData pageViewData,
  }) : _pageViewData = pageViewData;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(kScreenPaddingNormal),
      child: Column(
          children: <Widget>[
          Expanded(
            child: Center(
              child: SizedBox(
                width: 343.r,height: 343.r,
                child: AspectRatio(aspectRatio: 1, child: SvgPicture.asset(_pageViewData.assetsImage, fit: BoxFit.cover,width: 343.r,height: 343.r),),
              ),
            ),
          ),
          VerticalSpace(kScreenPaddingLarge.h),
          Text(
            tr(_pageViewData.titleText),
            textAlign: TextAlign.center,
            style: const TextStyle().titleStyle(fontSize: 18).colorBlack(),
          ),
            VerticalSpace(kScreenPaddingLarge.h),

            Center(
              child: Text(
                tr(_pageViewData.subText),
                textAlign: TextAlign.center,
                style: const TextStyle().descriptionStyle(),
              ),
            ),
        ],
      ),
    );
  }
}
