import 'package:base_app/core/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../core/res/resources.dart';

import '../../../generated/assets.dart';



class NotificationIcon extends StatelessWidget {
  final int _count;
  final GestureTapCallback? _onTap;
  const NotificationIcon({super.key,
    required int count,
     GestureTapCallback? onTap,
  })  : _count = count,
        _onTap = onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kScreenPaddingNormal.w),
      width: 48.r,
      height: 48.r,
     decoration: const BoxDecoration().listStyle().customColor(Theme.of(context).primaryColorLight),
      child: Center(
        child: GestureDetector(
          onTap: kIsAuth?_onTap:(){},
          child: Stack(clipBehavior: Clip.none, children: [
            // Gif(image:const  AssetImage(Assets.gifGifBell),height: 28, width: 28,autostart: _count>0?Autostart.loop  :Autostart.no,),
            SvgPicture.asset(
              Assets.svgNotificationIcon,
              height: 24.h,
              color: Theme.of(context).primaryColor,
              width: 22.w,
            ),
           if(_count>0)
              Positioned(
                right: -4,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  width: 16.r,
                  height: 16.r,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor,border: Border.all(color: Theme.of(context).backgroundColor)),
                  child: FittedBox(fit: BoxFit.scaleDown,child: Text('$_count', style: TextStyle().descriptionStyle().boldStyle().colorWhite())),//color: Theme.of(context).backgroundColor, fontSize: 8)),
                ),
              ),

          ])
        ),
      ),
    );
  }


}
