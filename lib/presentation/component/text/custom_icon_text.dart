import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';

import '../component.dart';


class CustomIconText extends StatelessWidget {
  final String _title;
  final String _svgIcon;
  final int _maxLines;
  final Color? _iconColor;
  final double _iconSize;
  final Color? _textColor;
  final MainAxisAlignment _mainAxisAlignment;
  final TextStyle? _textStyle;
  final bool _isExpanded;

  const CustomIconText({
    super.key,
    required String title,
    required String svgIcon,
    Color? iconColor,
    int maxLines =1,
    double iconSize =20,
    Color? textColor,
    bool isExpanded = false,
    TextStyle? textStyle,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  })  : _title = title,
        _svgIcon = svgIcon,
        _iconSize = iconSize,
        _isExpanded = isExpanded,
        _textStyle = textStyle,
        _maxLines = maxLines,
        _textColor = textColor,
        _mainAxisAlignment = mainAxisAlignment,
        _iconColor = iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        CustomSVGIcon(
          _svgIcon,
          color: _iconColor,
          height: _iconSize.r,
          width: _iconSize.r,
        ),
        HorizontalSpace(kFormPaddingAllLarge.w),
        if(_isExpanded)
        Expanded(
          child: AutoSizeText(_title,
              style:  _textStyle??(Theme.of(context).inputDecorationTheme.labelStyle??const TextStyle()).ellipsisStyle().customColor(_textColor),
              maxLines: _maxLines),
        ),

        if(!_isExpanded)
          AutoSizeText(_title,
              style:  _textStyle??(Theme.of(context).inputDecorationTheme.labelStyle??const TextStyle()).ellipsisStyle().customColor(_textColor),
              maxLines: _maxLines),
      ],
    );
  }

}
