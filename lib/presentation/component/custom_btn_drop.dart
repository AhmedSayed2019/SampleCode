
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/res/resources.dart';
import 'component.dart';


class CustomButtonArrow extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? value;
  final String? error;
  final Widget? widget;
  final String? iconSVG;
  final Color? color;
  final Color? textColor;
  final IconData? iconData;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool bold = true;
  final bool loading = false;
  final bool fullWidth = false;
  final bool shadow = false;
  final bool isRequired = false;
  final bool isDark;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;

  const CustomButtonArrow(
      {Key? key,
      this.value,
      this.label,
      this.hint,
      this.error,
      this.iconData,
      this.iconSVG,
      this.widget,
      this.isDark = false,
      this.width,
      this.height,
      this.color,
      this.textColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label!=null)...[
          Row(
            children: [
              if (iconSVG != null) ...[
              SizedBox(height: 20.r,width: 20.r,child: Center(child:CustomSVGIcon(iconSVG!,color:Theme.of(context).primaryColor))),
                HorizontalSpace(kFormPaddingAllLarge.w)
              ],
              Expanded(child: Text(label!,style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r))),
              // if (widget.endWidget != null) ...[
              //   HorizontalSpace(kFormPaddingAllLarge.w),
              //   widget.endWidget!,
              //
              // ],
            ],
          ),
          VerticalSpace(kFormPaddingAllLarge.h)

        ],

        InkWell(
          onTap:onTap,
          borderRadius: const BorderRadius.all(Radius.circular(kFormPaddingAllLarge),),
          child: CustomTitleContainer(
            title: '',//label != null ? hint : null,
            textAlign: context.locale.languageCode == 'ar' ?TextAlignTitledContainer.Right :TextAlignTitledContainer.Left,

            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall.r),),
                  border: Border.all(color:error!=null? Theme.of(context).errorColor: Theme.of(context).highlightColor)
              ),
              padding: const EdgeInsets.all(kFormPaddingAllSmall),
              child: loading
                  ? Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(4),
                        child: CircularProgressIndicator(
                          color: textColor ?? Colors.white,
                          strokeWidth: 1.2,
                        ),
                      ),
                    )
                  : Container(
                      height: height ?? 35,
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge),
                      child: Row(
                        children: [
                          if(iconData!=null)...[
                            Icon(iconData,color: Theme.of(context).inputDecorationTheme.prefixIconColor,),
                            HorizontalSpace(8.w)
                          ],

                            if(iconSVG!=null)...[
                               Center(child: widget),
                            ]
                           else if(iconSVG!=null)...[
                              SizedBox(height: 20.r,width: 20.r,child: Center(child: SvgPicture.asset(iconSVG!,height: 20.r,width: 20.r,color: Theme.of(context).primaryColorLight,))),
                            HorizontalSpace(8.w)
                          ],

                          Expanded(
                            child: Text(
                              tr(value ?? ''),
                              style:  label==null? Theme.of(context).inputDecorationTheme.hintStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
            ),
          ),
        ),
        _buildErrorView(context)
      ],
    );
  }

  _buildErrorView(BuildContext context) {
    return error != null
        ? Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  HorizontalSpace(12.w),
                  Text(error ?? '', style: Theme.of(context).inputDecorationTheme.errorStyle?.copyWith(color: Theme.of(context).errorColor),),
                ],
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
