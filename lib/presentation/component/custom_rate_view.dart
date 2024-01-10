import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'component.dart';


class CustomRateView extends StatelessWidget {
  final ValueChanged<double>? _onRatingUpdate;
  final bool _ignoreGestures;
  final double _iconSize;
  final num _rating ;
  final String? _ratingCount ;
  const CustomRateView({super.key,
     ValueChanged<double>? onRatingUpdate,
     bool ignoreGestures = true,
    double iconSize= 18,
    required num rating,
     String? ratingCount,
  })  : _onRatingUpdate = onRatingUpdate,
        _ignoreGestures = ignoreGestures,
        _iconSize = iconSize,
        _rating = rating,
        _ratingCount = ratingCount;


  @override
  Widget build(BuildContext context) {
    if(_onRatingUpdate==null){
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
    }else{
      return  RatingBar(
        initialRating: _rating.toDouble(),
        itemSize: _iconSize,
        minRating: 1,
        ignoreGestures: _ignoreGestures,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        onRatingUpdate:_onRatingUpdate??(rate){},
        ratingWidget: RatingWidget(
          full: Icon(CupertinoIcons.star_fill, size: _iconSize, color: appRateActive),
          half: Icon(CupertinoIcons.star_lefthalf_fill, size: _iconSize, color:appRateActive),
          empty: Icon(CupertinoIcons.star, size: _iconSize, color: appRateInActive),
        ),

      );
    }


  }


}
