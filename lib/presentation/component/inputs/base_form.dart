
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/text_styles.dart';

import '../../../../core/res/font_manager.dart';
import '../../../../core/res/values_manager.dart';
import '../../../../generated/locale_keys.g.dart';
import '../spaces.dart';
import 'expanded_form_view.dart';
import 'orientation_view.dart';





class CustomTextField extends StatefulWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? validateMassage;
  final bool isHorizontal;

  final bool enable;
  final bool isDark;
  final bool isDarkBackground;
  final bool autoValidate;
  final bool readOnly;
  final bool obscureText;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;

  final int? maxLength;
  final int? lines;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Color? prefixIconColor;
  final Color? background;

  final IconData? prefixIcon;
  final IconData? suffixIconData;

  final Widget? suffixData;
  final Widget? prefixWidget;
  final Widget? startWidget;
  final Widget? endWidget;
  final Widget? icon;


  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSaved;
  final Function? validateFunc;
  final Function? onSubmit;


  final TextAlign? textAlign;
  final TextInputType type;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  const CustomTextField({Key? key,
    this.background,
    this.prefixIcon,
    this.textAlign,
    this.prefixIconColor,
    this.defaultValue,
    this.startWidget,
    this.endWidget,
    // this.error,
    this.hint,
    this.onTap,
    this.autoValidate = false,
    this.isDarkBackground = false,
    this.obscureText = false,
    this.readOnly=false,
    this.isHorizontal=false,
    this.enable = true,
    this.isDark = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus=false,

    this.label,
    this.contentPaddingH = 16,
    this.lines = 1,
    this.fontSize = 14,
    this.radius = kFormRadius,
    this.onChange,
    this.onSaved,
    this.suffixIconData,
    this.validateFunc,
    this.suffixText,
    this.validateMassage,
    this.formatter,
    this.type = TextInputType.text,
    this.controller,
    this.suffixData,
    this.onSubmit,
    this.maxLength,
    this.icon,
    this.textInputAction,
    this.prefixWidget,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.controller != null) {
      widget.controller!.text = widget.defaultValue!;
    }else{
    }
  }
  @override
  Widget build(BuildContext context) {
    // if (widget.error == '') {
    //   widget.error = null;
    // }
    return Column(
      children: [
        if(widget.label!=null)...[
          Row(
            children: [
              if (widget.startWidget != null) ...[
                widget.startWidget!,
                HorizontalSpace(kFormPaddingAllLarge.w)
              ],
              Expanded(child: Text(widget.label!,style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r))),
              if (widget.endWidget != null) ...[
                HorizontalSpace(kFormPaddingAllLarge.w),
                widget.endWidget!,
              ],
            ],
          ),
          VerticalSpace(kFormPaddingAllLarge.h)

        ],


        GestureDetector(
          onTap: widget.onTap,
          child: OrientationView(
            isHorizontal: widget.isHorizontal,
            children: [
              if (widget.isHorizontal)...[
                CircleAvatar(radius: 4.r, backgroundColor: widget.isDark?Colors.white:Theme.of(context).hintColor),
                HorizontalSpace(8.h),
                if (widget.label != null)...[
                  Expanded(flex: 2,child: Text(widget.label!, style: const TextStyle().regularStyle().customColor( widget.isDark?/*Theme.of(context).cardColor*/Colors.white:Theme.of(context).hintColor),)),
                ]
              ],

              // if (!widget.isHorizontal && widget.label != null) ...[
              //   Text(widget.label!, style: const TextStyle().regularStyle(fontSize: 16).boldStyle().customColor( widget.isDark?Theme.of(context).cardColor:Colors.black),),
              //   const VerticalSpace(kFormPaddingAllSmall,),
              // ],

              if (widget.isHorizontal) HorizontalSpace(16.w),
              ExpandedHelperView(
                isExpanded: widget.isHorizontal ,
                child: TextFormField(
                  cursorColor:widget.isDark? Colors.white: Theme.of(context).primaryColor,
                  readOnly:widget.readOnly,
                  textInputAction: widget.textInputAction,
                  maxLength: widget.maxLength,
                  enableSuggestions: false,
                  autofocus: widget.autofocus,
                  obscureText: widget.obscureText,
                  onTap: widget.onTap,
                  controller:  widget.controller,
                  textAlign: widget.textAlign??TextAlign.start,
                  autovalidateMode: widget.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  style:  TextStyle(
                    color: widget.isDark?Colors.black:Colors.black,
                    fontSize: 14.sp,
                    fontFamily: FontConstants.fontFamily,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                      // border: widget.noBorder ? InputBorder.none : Theme.of(context).inputDecorationTheme.border,
                      // disabledBorder: widget.noBorder ? InputBorder.none : Theme.of(context).inputDecorationTheme.disabledBorder,
                      // focusedBorder: widget.noBorder ? InputBorder.none :  Theme.of(context).inputDecorationTheme.focusedBorder,
                      // errorBorder: widget.noBorder ? InputBorder.none :Theme.of(context).inputDecorationTheme.errorBorder,

                      border: widget.noBorder ? InputBorder.none : Theme.of(context).inputDecorationTheme.border,
                      disabledBorder: widget.noBorder ? InputBorder.none : Theme.of(context).inputDecorationTheme.disabledBorder,
                      focusedBorder: widget.noBorder ? InputBorder.none :  Theme.of(context).inputDecorationTheme.focusedBorder,
                      errorBorder: widget.noBorder ? InputBorder.none :Theme.of(context).inputDecorationTheme.errorBorder,


                      errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                      hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(color: widget.isDark?Theme.of(context).highlightColor:Theme.of(context).hintColor),
                      labelStyle: Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(color: widget.isDark?Colors.black:Colors.black),
                      // labelStyle: Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(color: widget.isDark?Theme.of(context).cardColor:Theme.of(context).textTheme.bodyMedium?.color),
                      suffixStyle: Theme.of(context).inputDecorationTheme.suffixStyle,

                      hintText: widget.hint,
                      // labelText:widget.label,
                      filled: true,

                      fillColor:widget.background??(widget.isDark?Theme.of(context).primaryColor:widget.enable? widget.background??Theme.of(context).highlightColor/*enable background*/:widget.background??Theme.of(context).disabledColor/*disable background*/),
                      counterStyle:  TextStyle(color: Theme.of(context).primaryColor),
                      suffixText: widget.suffixText,
                      // suffixIcon: widget.icon!= null ?Container(width: 50,alignment: Alignment.center,child: widget.icon):(widget.suffixData ?? (widget.suffixIconData == null ? null : Icon(widget.suffixIconData, color:widget.isDark?Theme.of(context).cardColor:Theme.of(context).primaryColor,))),
                      suffixIcon: widget.suffixData != null ? Container(width: 50, alignment: Alignment.center, child: widget.suffixData,) : (widget.suffixData ?? (widget.suffixIconData == null ? null : Icon(widget.suffixIconData, color: Theme.of(context).primaryColor,))),

                      // suffixStyle:  const TextStyle(
                      //   color:grayScaleColor,
                      //   fontSize: 12,
                      //   fontWeight: FontWeight.normal,
                      // ),
                      prefixIcon:widget.prefixWidget??( widget.prefixIcon == null ? null : Icon(widget.prefixIcon, size: 24,color:widget.prefixIconColor??(widget.isDark?Theme.of(context).cardColor:Colors.black),)),


                      contentPadding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal,vertical: 10)),
                  keyboardType: widget.type,
                  validator: (value) {
                    if (widget.validateFunc != null&& widget.isRequired) {
                      return widget.validateFunc!(value);
                    }else
                    if ((value == null || value.isEmpty) && widget.isRequired) {
                      return widget.validateMassage??tr(LocaleKeys.msgFormFieldRequired);
                    }
                    return null;
                  },
                  enabled: widget.enable,
                  maxLines: widget.lines,

                  inputFormatters: widget.formatter,
                  onChanged: (String newValue) {
                    if (widget.onChange != null) return widget.onChange!(newValue);
                    return;
                  },
                  onFieldSubmitted: (String newValue) {
                    if (widget.onSubmit != null) return widget.onSubmit!(newValue);
                    return;
                  },
                  onSaved: (String? newValue) {
                    if (widget.onSaved != null) return widget.onSaved!(newValue??'');
                    return;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

