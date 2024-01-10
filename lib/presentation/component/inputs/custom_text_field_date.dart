
import 'package:base_app/domain/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/utils/date/date_converter.dart';
import 'package:base_app/generated/assets.dart';
import 'package:base_app/generated/locale_keys.g.dart';

import '../svg_icon.dart';
import 'base_form.dart';


class CustomTextFieldDate extends StatefulWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? iconSVG;

  final DateTime? calendarStartDate;
  final DateTime? calendarEndDate;
  final String? label;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;
  final VoidCallback? onTap;
  final int lines;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final ValueChanged<String>? onSubmit;
  final IconData? iconData;
  final IconData? suffixIconData;
  final Widget? suffixData;
  final double fontSize;
  final double? radius;
  final double contentPaddingH;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final Color? background;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  const CustomTextFieldDate({Key? key,
    this.background,
    this.iconData,
    this.iconSVG=Assets.iconsCalenderIcon,
    this.defaultValue,
    this.calendarStartDate,
    this.calendarEndDate,
    // this.error,
    this.hint,
    this.onTap,
    this.autoValidate = false,
    this.noBorder = false,
    this.autofocus = false,
    this.isRequired = true,
    this.label,
    this.contentPaddingH = 16,
    this.lines = 1,
    this.fontSize = 14,
    this.radius ,
    this.onChange,
    this.textInputAction,
    this.suffixIconData,
    this.validateFunc,
    this.suffixText,
    this.formatter,
    this.type = TextInputType.text,
    required this.controller,
    this.suffixData,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<CustomTextFieldDate> createState() => _CustomTextFieldDateState();
}

class _CustomTextFieldDateState extends State<CustomTextFieldDate> {
  final tag = 'CustomFieldDate';
  late DateTime? _selectedDate;


  @override
  void initState() {
    _selectedDate = widget.defaultValue != null?DateConverter.isoStringToLocalDate(widget.defaultValue??""): null;
    // _selectedDate = widget.defaultValue != null?DateConverter.isoStringToLocalDate(widget.defaultValue??""): DateTime.now();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text =DateConverter.slotDateCalender( _selectedDate) ;

    return InkWell(
      onTap: () =>_showCalenderDialog(context),
      child: CustomTextField(
        background: widget.background,
        suffixData:SizedBox(height: 18.r,width: 18.r,child: Center(child:CustomSVGIcon(Assets.fieldIconCalenderIcon,color: Theme.of(context).hintColor) , )),

        defaultValue: widget.defaultValue,
        onTap: widget.onTap?? () {_showCalenderDialog(context);},
        autoValidate: widget.autoValidate,
        // enable: false,
        readOnly: true,

        noBorder: widget.noBorder,
        isRequired: widget.isRequired,
        label: widget.label,
        hint: widget.hint,
        contentPaddingH:widget.contentPaddingH,
        lines:widget.lines,
        fontSize:widget.fontSize,
        radius:widget.radius,
        onChange:widget.onChange,
        suffixIconData:widget.suffixIconData,
        validateFunc: (value) {

          if ((value == null || value.isEmpty) && widget.isRequired) {
          return tr(LocaleKeys.msgBirthDateRequired);
          }else if (widget.validateFunc != null) {
            return widget.validateFunc!(value);
          }
          return null;
        },
        suffixText: widget.suffixText,
        formatter: widget.formatter,
        // type: widget.TextInputType.number,
        controller: widget.controller,
        // suffixData: widget.suffixData,
        onSubmit: widget.onSubmit,
        // readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        // maxLength: widget.maxLength,
        // icon: widget.icon,
        textInputAction: widget.textInputAction,
      ),
    );

  }

  Future<void> _showCalenderDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:(_selectedDate??widget.calendarEndDate??DateTime.now()),
        firstDate: widget.calendarStartDate ?? DateTime(2015, 8),
        lastDate: widget.calendarEndDate ?? DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      String data = DateConverter.slotDate( picked);
      if(widget.onSubmit!=null) widget.onSubmit!(data);
      setState(() {_selectedDate = picked;widget.controller.text = data;});
    }
  }
}
