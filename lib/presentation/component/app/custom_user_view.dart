import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component.dart';

class CustomUserView extends StatelessWidget {
  final String _image ;
  final String _name ;
  final num? _rating ;
  final String? _ratingCount ;
  final int? _userId ;
  final UserType _userType ;

  const CustomUserView({super.key,
    required String image,
    required String name,
    required num? rating,
    required String? ratingCount,
    required int? userId,
    required UserType userType,
  })  :
        _image = image,
        _name = name,
        _userType = userType,
        _userId = userId,
        _rating = rating,
        _ratingCount = ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          imageUrl: _image,
          height: 54.r,
          width: 54.r,
        ),

        HorizontalSpace(kFormPaddingAllLarge.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name,style: const TextStyle().regularStyle().boldStyle()),
              if(_rating != null && _ratingCount!=null&& _userId!=null)
                CustomRateView(rating: _rating!,ratingCount:  _ratingCount!,userId: _userId,userType: _userType),

            ],
          ),
        ),
      ],
    );
  }

}
