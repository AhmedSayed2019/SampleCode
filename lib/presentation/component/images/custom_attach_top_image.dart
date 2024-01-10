
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/decoration.dart';

import '../../../../domain/logger.dart';
import '../../../../core/res/values_manager.dart';
import '../../../../core/utils/attach_image.dart';
import '../component.dart';

class CustomAttachTopImageView extends StatelessWidget {
  final _tag = 'AttachTopImageView';
  final String? selectedImages;
  final double height;


  final Function(String path) onAttachImage;

  const CustomAttachTopImageView({
    Key? key,
    required this.selectedImages,
    this.height = 150,
    required this.onAttachImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPictures(context, selectedImages);
  }

  Widget buildPictures(BuildContext context, String? selectedImages) {
    log(_tag, 'path : $selectedImages');
    return SizedBox(
      height: height.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 150.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(kFormRadiusSmall),
              ),
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(kFormRadiusSmall)),
              child: selectedImages == null
                  ? _buildEmptyImage(context)
                  : CustomItemPickedImage(path: selectedImages),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child:Material(
          //     color: Colors.transparent,
          //     child: InkWell(
          //       onTap: () => onPickImagesPressed(context),
          //       borderRadius: BorderRadius.circular(100),
          //       child: Container(
          //         height: 30.h,
          //         width: 30.h,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(
          //             width: 4,
          //             color: Theme.of(context).scaffoldBackgroundColor,
          //           ),
          //           color: Theme
          //               .of(context)
          //               .primaryColor,
          //         ),
          //         child: Icon(
          //           Icons.edit,
          //           size: 20.h,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _buildEmptyImage(BuildContext context) {
    return Container(
      height: height.h,
      decoration: const BoxDecoration().listStyle(),
      padding: EdgeInsets.all(kFormPaddingAllSmall.r),
      child: Stack(
        children: [
          // SvgPicture.asset(Assets.svgImageAvatare,height: height.h,),
          Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onPickImagesPressed(context),
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration:const BoxDecoration().listStyle().customColor(Theme.of(context).cardColor),
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //
                  //   color: Theme.of(context).cardColor,
                  // ),
                  child: Icon(
                    Icons.add,
                    size: 22.h,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  onRemoveServiceImagePressed(BuildContext context, String selectedImag) {}
}
