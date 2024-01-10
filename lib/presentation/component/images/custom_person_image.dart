import 'dart:io';

import 'package:base_app/presentation/component/component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:base_app/core/extensions/num_extensions.dart';

import '../../../../generated/assets.dart';
import '../../../../core/utils/attach_image.dart';
import '../../../../core/utils/validators.dart';


class CustomPersonImage extends StatelessWidget {
  final String? _imageUrl;
  final String? _avatar;
  final String? _error;
  final double _borderSize;
  final double _size;
  final bool _canEdit;
  final bool _showShadow;
  final bool _isLoading;
  final Function(String path)? _onAttachImage;

  const CustomPersonImage({
    super.key,
    String? imageUrl,
    String? avatar,
    String? error,
    double borderSize = 4,
    double size = 100,
    bool canEdit = false,
    bool showShadow = true,
    bool isLoading = false,
    Function(String path)? onAttachImage,
  })  : _imageUrl = imageUrl,
        _avatar = avatar,
        _borderSize = borderSize,
        _error = error,
        _size = size,
        _isLoading = isLoading,
        _showShadow = showShadow,
        _canEdit = canEdit,
        _onAttachImage = onAttachImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: _size.r,
            height: _size.r,
            decoration: BoxDecoration(
              border: Border.all(width: _borderSize, color: _error!=null?Theme.of(context).errorColor:Theme.of(context).scaffoldBackgroundColor),
              boxShadow:_showShadow? [
                   BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10),
                )
              ]:null,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: (_imageUrl ?? '' ).isEmpty
                  ? _buildPlaceholder()
                  : _imageUrl!.endsWith('.svg')
                  ? SvgPicture.network(_imageUrl! ,width:  _size.r , height:  _size.r )
                  : _imageUrl!.contains('assets/images/') &&  !Validators.isURL(_imageUrl)
                  ? Image.asset(_imageUrl! ,width: _size.r , height:  _size.r )
                  : !Validators.isURL(_imageUrl)
                  ? Image.file(File(_imageUrl!), width:  _size.r , height:  _size.r , fit: BoxFit.fill)
                  : CachedNetworkImage(placeholder: (ctx, url) => _buildPlaceholder(), width: _size.r, height: _size.r, fit: BoxFit.cover, imageUrl: _imageUrl ?? '', errorWidget: (c, o, s) => _buildPlaceholder(),
              ),
            ),
          ),
          if (_canEdit)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor,),
                  color: Theme.of(context).primaryColor,
                ),
                child: _isLoading?const CustomLoadingSpinner(color: Colors.white,):Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      String? path = await onPickImagesPressed(context);
                      if (path != null && _onAttachImage != null) {_onAttachImage!(path);}
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
  _buildPlaceholder(){
    return Image.asset(_avatar ?? Assets.imagesImgAvatarPlaceholder,
      width: _size.r,
      height:_size.r,
      fit: BoxFit.cover,
    );
  }
}
