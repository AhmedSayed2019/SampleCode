import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


import 'component.dart';


class CustomRateView extends StatelessWidget {
  final double _iconSize;
  final num _rating ;
  final String? _ratingCount ;
  const CustomRateView({super.key,
    double iconSize= 18,
    required num rating,
     String? ratingCount,
  })  :
        _iconSize = iconSize,
        _rating = rating,
        _ratingCount = ratingCount;


  @override
  Widget build(BuildContext context) {
      return  Row(
        children: [
          Icon(CupertinoIcons.star_fill, size: _iconSize, color: appRateActive),
          HorizontalSpace(kFormPaddingAllSmall.w),
          Text('( ',style: const TextStyle().regularStyle(fontSize: 12).customColor(appRateActive)),
          Text('${_rating.toDouble()}',style: const TextStyle().semiBoldStyle(fontSize: 12).colorHint()),
          Text(' )',style: const TextStyle().regularStyle(fontSize: 12).customColor(appRateActive)),

          if(_ratingCount != null)...[
            HorizontalSpace(kFormPaddingAllSmall.w),
            Text('[ ',style: const TextStyle().regularStyle(fontSize: 12).colorHover()),
            Text('$_ratingCount ${tr(LocaleKeys.review)}',style: const TextStyle().regularStyle(fontSize: 12).colorHover().underLineStyle()),
            Text(' ]',style: const TextStyle().regularStyle(fontSize: 12).colorHover())
          ],

        ],
      );



  }


}
