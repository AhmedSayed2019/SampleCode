
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../../../core/res/resources.dart';
import '../component.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onTap;
  final Widget? _child;
  final String? _title;
  final Color? _color;
  final Color? _textColor;
  final Color? _borderColor;
  final double? _width;
  final double? _height;
  final double? _fontSize;
  final bool _isRounded;
  final bool _isOutlined;
  final bool _widerPadding;
  final bool _isCircle;
  final bool _loading;
  final double? _loadingSize;
  final bool _enable;


  const CustomButton({super.key,
    required VoidCallback onTap,
    Widget? child,
    String? title,
    Color? color,
    Color? textColor,
    Color? borderColor,
    double? width,
    double? fontSize,
    double? height,
    double? loadingSize,
    bool isCircle= false,
    bool isRounded= true,
    bool isOutlined= false,
    bool widerPadding= false,
    bool loading= false,
    bool enable= true,
  })  : _onTap = onTap,
        _child = child,
        _title = title,
        _color = color,
        _isCircle = isCircle,
        _borderColor = borderColor,
        _textColor = textColor,
        _width = width,
        _fontSize = fontSize,
        _loadingSize = loadingSize,
        _height = height,
        _isRounded = isRounded,
        _isOutlined = isOutlined,
        _widerPadding = widerPadding,
        _enable = enable,
        _loading = loading;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:_width==0?null: (_width??deviceWidth),
      height: (_height??52).h,
      child: TapEffect(
        isClickable: ! (!_enable||_loading),
        onTap: (!_enable||_loading)?null:_onTap,
        child: Container(
          width:_width==0?null: (_width??deviceWidth),
          height: (_height??56).h,
          decoration: _isOutlined
              ? null
              : _color==null? BoxDecoration(shape: _isCircle?BoxShape.circle:BoxShape.rectangle).customColor(Theme.of(context).primaryColor).radius(radius: kFormRadiusSmall)
              :  BoxDecoration(shape: _isCircle?BoxShape.circle:BoxShape.rectangle).customColor(_color ?? Theme.of(context).primaryColor).radius(radius: kFormRadiusSmall),
          child: MaterialButton(
            highlightElevation: 0,
            onPressed: (!_enable||_loading)?(){}: _onTap,
            padding: !_widerPadding ? EdgeInsets.symmetric(vertical: 4.r, horizontal:_width==0?0: 4.r) : EdgeInsets.symmetric(vertical: 12.h, horizontal:_width==0?0:16.w),
            elevation: 0,
            shape: _isRounded
                ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(kFormRadiusSmall.r), side: BorderSide(color: _borderColor??_color??Colors.transparent/* ?? Theme.of(context).primaryColor*/, width: 1.5.w,))
                : RoundedRectangleBorder(borderRadius: BorderRadius.circular(kFormRadiusSmall.r), side: BorderSide(color: _borderColor??_color??Colors.transparent/* ?? Theme.of(context).primaryColor*/, width: 1.5.w)),
            child: _loading
                ? CustomLoadingSpinner( size: (_loadingSize ?? 20).h,color: Colors.white)
                :_title!=null ? Center(child: Text(_title!,style: const TextStyle().regularStyle(fontSize: _fontSize??16).regularStyle().boldStyle().customColor(_textColor??Colors.white),),): _child??const SizedBox(),
          ),
        ),
      ),
    );
  }
}
