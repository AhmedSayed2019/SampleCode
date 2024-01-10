
import 'package:flutter/material.dart';

import '../../core/res/resources.dart';
import '../../generated/assets.dart';
import 'component.dart';


class CustomSheetHeader extends StatelessWidget {
  final VoidCallback onCancelPress;

  final String title;

  const CustomSheetHeader({Key? key,
    required this.onCancelPress,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.all(kScreenPaddingNormal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle().titleStyle(fontSize: 16).colorBlack(),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: onCancelPress ,
            child:const CustomSVGIcon(Assets.iconsExitIcon),
          ),
        ],
      ),
    );
  }
}
