import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';

import 'base_form.dart';



class CustomTextFieldSearch extends StatelessWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final bool enable;
  final String? label;
  final Color? prefixIconColor;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final VoidCallback? onTap;
  final int? lines;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onFilterTap;
  final Function? validateFunc;
  final Function? onSubmit;
  final IconData? iconData;
  final IconData? suffixIconData;
  final Widget? suffixData;
  final double? fontSize;
  final bool isDarkBackground;
  final bool isDark;
  final bool ?readOnly;
  final bool isSearch;
  final double? radius;
  final double? contentPaddingH;
  final List<TextInputFormatter>? formatter;
  final Color? background;
  final TextEditingController? controller;

  const CustomTextFieldSearch({
    Key? key,
    this.background,
    this.iconData,
    this.defaultValue,
    this.onFilterTap,
    this.hint,
    this.onTap,
    this.prefixIconColor,
    this.autoValidate = false,
    this.enable = true,
    this.noBorder = false,
    this.isDarkBackground = false,
    this.isDark = false,
    this.isRequired = true,
    this.label,
    this.readOnly,
    this.contentPaddingH,
    this.lines,
    this.fontSize,
    this.radius,
    this.isSearch=true,
    this.onChange,
    this.suffixIconData,
    this.validateFunc,
    this.suffixText,
    this.formatter,
    this.controller,
    this.suffixData,
    this.onSubmit,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      background: background??CupertinoColors.tertiarySystemFill,
      // prefixIcon: iconData ?? Icons.search,
      // prefixWidget:SizedBox(height: 20.r,width: 20.r,child: Center(child:CustomSVGIcon(Assets.svgSearchIcon,color: Theme.of(context).primaryColor)  )),

      prefixIconColor:prefixIconColor?? Theme.of(context).primaryColor,
      defaultValue: defaultValue,
      hint: hint,
      onTap: onTap,
      autoValidate: autoValidate,
      enable: enable,
      noBorder: noBorder,
      isRequired: isRequired,
      readOnly: readOnly??false,
      label: label,
      isDark: isDark,
      contentPaddingH: contentPaddingH,
      lines: lines ?? 1,
      fontSize: fontSize,
      radius: radius,
      onChange: onChange,
      suffixIconData: suffixIconData,
      validateFunc: validateFunc ,
      suffixText: suffixText,
      formatter: formatter,
      type: TextInputType.text,
      textInputAction: TextInputAction.search,
      isDarkBackground:isDarkBackground,
      controller: controller,
      suffixData: suffixData ?? (onFilterTap!=null?
          Padding(
              padding: EdgeInsets.all(kFormPaddingAllSmall.w),
              child: Material(
                elevation: 2,
                color: Theme.of(context).primaryColorDark,
                borderRadius: const BorderRadius.all(
                  Radius.circular(kFormRadius),
                ),

                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(kFormRadius),
                  ),
                  onTap: onFilterTap,
                  child: Padding(
                    padding: EdgeInsets.all(kFormPaddingAllSmall.w),
                    child: Icon(
                      Icons.tune,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              )):const SizedBox()),
      onSubmit: onSubmit,
    );
  }
}
