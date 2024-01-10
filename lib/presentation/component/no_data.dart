import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../core/res/resources.dart';
import '../../../generated/assets.dart';
import '../../../generated/locale_keys.g.dart';
import 'component.dart';



class NoDataScreen extends StatelessWidget {
  final String?  _title;
  final String? _desc;
  final String? _image;
  final String _imageSvg;
  final double _padding;

  const NoDataScreen({super.key,
    String? title ,
    String? desc,
    String? image,
    double padding = kFormPaddingHorizontal,

    String imageSvg=Assets.noDataNoData,
  })  : _title = title,
        _padding = padding,
        _desc = desc,
        _image = image,
        _imageSvg = imageSvg;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(_padding.r),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (_image != null)
            Image.asset(
              _image!,
              // width: 150.r,
              // height: 150.r,
            )
          else
            SvgPicture.asset(
              _imageSvg,
              width: 170.w,
              height: 170.h,
            ),
          const VerticalSpace(kFormPaddingHorizontal),

          AutoSizeText(
            _title??tr( LocaleKeys.noResultFound),
            style: const TextStyle().regularStyle().colorBlack(),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(kScreenPaddingNormal.h),

          Text(
            _desc??'',
            style: const TextStyle().regularStyle(fontSize: 12).colorHint(),
            textAlign: TextAlign.center,
          ),
          // const VerticalSpace(kScreenPaddingNormal),
          ],
        ),
      ),
    );
  }
}
