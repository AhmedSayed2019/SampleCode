import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/decoration.dart';

import '../../../../generated/assets.dart';
import '../../../../core/res/values_manager.dart';
import '../../../../core/utils/attach_image.dart';
import '../../../../core/utils/validators.dart';

class CustomImage extends StatelessWidget {
  final double _radius;
  final BorderRadius? _borderRadius;
  final Border? _border;
  final Color? _svgImageColor;

  final double? _width;
  final double _height;

  final String? _imageUrl;
  final String? _error;
  final BoxFit? _fit;

  final bool _canEdit;
  final bool _showPlaceholder;
  final bool _showBorder;
  final Function(String path)? _onAttachImage;


  const CustomImage({super.key,
    double radius = kFormRadius,
     BorderRadius? borderRadius,
    Border? border,
    double? width,
    double height = 140,
    String? imageUrl,
    String? error,
    BoxFit? fit = BoxFit.fill,
    Color? svgImageColor,
    bool canEdit = false,
    bool showPlaceholder = true,
    bool showBorder = false,
    Function(String path)? onAttachImage,
  })  : _radius = radius,
        _borderRadius = borderRadius,
        _border = border,
        _width = width,
        _height = height,
        _imageUrl = imageUrl,
        _error = error,
        _fit = fit,
        _canEdit = canEdit,
        _svgImageColor = svgImageColor,
        _showPlaceholder = showPlaceholder,
        _showBorder = showBorder,
        _onAttachImage = onAttachImage;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children:[ ClipRRect(
        borderRadius: _borderRadius ?? BorderRadius.all(Radius.circular(_radius.r)),
        child: Container(
          width: _width,
            decoration: const BoxDecoration()
                // .customColor(Theme.of(context).scaffoldBackgroundColor)
                .borderStyle(color: _error != null ? Theme.of(context).errorColor : _showBorder ? Theme.of(context).hintColor : Colors.transparent)
                .customRadius(borderRadius: _borderRadius ?? BorderRadius.all(Radius.circular(_radius.r))),

            child: (_imageUrl ?? '' ).isEmpty
              ? _buildPlaceholder(context)
              : !Validators.isURL(_imageUrl)
              ? Image.file(File(_imageUrl!), width: _width ?? deviceWidth, height: _height, fit: BoxFit.fill)
              : _imageUrl!.endsWith('.svg')
              ? SvgPicture.network(_imageUrl! ,width: _width ?? deviceWidth, height: _height,color: _svgImageColor??Theme.of(context).primaryColor)
              : CachedNetworkImage(
                  placeholder: (ctx, url) => _buildPlaceholder(context),
                  width:_width ?? deviceWidth,
                  height: _height,
                  fit: _fit,
                  imageUrl: _imageUrl ?? '',
                  errorWidget: (c, o, s) => _buildPlaceholder(context),
                ),
        ),
      ),
      if (_canEdit)
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            height: 32.r,
            width: 32.r,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Theme.of(context).scaffoldBackgroundColor), color: Theme.of(context).primaryColor),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  String? path = await onPickImagesPressed(context);
                  if (path != null && _onAttachImage != null) {_onAttachImage!(path);}
                },
                borderRadius: BorderRadius.circular(100),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],);
  }

  _buildPlaceholder(BuildContext context) {
    return _showPlaceholder
        ?  _onAttachImage != null?SizedBox(
            height: _height,
            width: _width ?? deviceWidth,
            // padding: EdgeInsets.all(kScreenPaddingNormal.r),
            child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          String? path = await onPickImagesPressed(context);
                          if (path != null && _onAttachImage != null) { _onAttachImage!(path); }
                        },
                        child: Image.asset(Assets.imagesPlaceholder, width: _width ?? deviceWidth, height: _height, fit: BoxFit.fill))),
          ): Image.asset(Assets.imagesPlaceholder, width: _width ?? deviceWidth, height: _height, fit: BoxFit.fill)
        : const SizedBox();
  }
}
