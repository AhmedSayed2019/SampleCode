import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_app/generated/locale_keys.g.dart';

import 'base_form.dart';


class CustomTextFieldArea extends StatelessWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? iconSVG;

  final bool readOnly;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;
  final bool enable;
  final bool isHorizontal;

  final int? lines;
  final int? maxLength;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Widget? icon;
  final Widget? suffixData;

  final IconData? iconData;
  final IconData? suffixIconData;

  final Color? background;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final Function? onSubmit;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  const CustomTextFieldArea({
    Key? key,
    this.suffixText,
    this.hint,
    this.defaultValue,
    this.label,
    this.iconSVG,
    this.autoValidate = false,
    this.readOnly = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus = false,
    this.isHorizontal = false,
    this.enable = true,
    this.lines=5,
    this.maxLength,
    this.fontSize,
    this.radius,
    this.contentPaddingH=16,
    this.formatter,
    this.icon,
    this.suffixData,
    this.iconData,
    this.suffixIconData,
    this.background,
    this.onTap,
    this.onChange,
    this.validateFunc,
    this.onSubmit,
    this.controller,
    this.textInputAction,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          background: background,
          prefixIcon: iconData,
          // startWidget:iconSVG==null?null: SizedBox(height: 20.r,width: 20.r,child: Center(child: SvgPicture.asset(iconSVG!,height: 20.r,width: 20.r,color: Theme.of(context).primaryColor))),
          defaultValue: defaultValue,
          hint: hint,
          onTap: onTap,
          autoValidate: autoValidate,
          isHorizontal: isHorizontal,
          enable: enable,
          noBorder: noBorder,
          isRequired: isRequired,
          label: label,
          contentPaddingH: contentPaddingH,
          lines: lines,
          fontSize: fontSize,
          radius: radius,
          onChange: onChange,
          suffixIconData: suffixIconData,
          validateFunc: validateFunc ??
                  (value) {
                if ((value == null || value.isEmpty) && isRequired) {
                  return tr(LocaleKeys.msgFormFieldRequired);
                }   else if ( (value??'').toString().length<10) {
                  return tr(LocaleKeys.msgInvalidAboutShort);
                }
                if (validateFunc != null) return validateFunc!(value);
                return null;
              },
          suffixText: suffixText,
          formatter: formatter,
          type: TextInputType.multiline,
          controller: controller,
          suffixData: suffixData,
          onSubmit: onSubmit,
          autofocus: autofocus,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}
