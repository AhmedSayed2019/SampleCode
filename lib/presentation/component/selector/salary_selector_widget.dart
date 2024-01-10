import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/price_converter.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class SalaryWidget extends StatefulWidget {
  final int _value;
  final Function(int)? _onUpdate;
  final String? _error;

  const SalaryWidget({super.key,
    required int value,
     Function(int)? onUpdate,
     String? error,
  })  : _value = value,
        _onUpdate = onUpdate,
        _error = error;

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  final _tag = 'SalaryWidget';
  int _value = 500;
  @override
  void initState() {
    _value = widget._value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(LocaleKeys.salary),style:  Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: const Color(0xff696F79),fontSize: 12.r)),
        VerticalSpace(kFormPaddingAllLarge.h),

        Container(
          height:45 ,
          decoration: const BoxDecoration().customColor(Theme.of(context).highlightColor).radius() ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TapEffect(
                onTap: ()=>_onSup(),
                child: Container(
                  height: 24.r,
                  width: 24.r,
                  alignment: Alignment.center,
                  decoration:const BoxDecoration().circle().customColor(Colors.white).shadow(),
                  child: Text('-',style: const TextStyle().semiBoldStyle(fontSize: 21).activeColor(),),
                ),
              ),


              Text(PriceConverter.convertPrice(_value),style: const TextStyle().regularStyle(fontSize: 16).colorBlack(),),

              TapEffect(
                onTap: ()=>_onAdd(),
                child: Container(
                  height: 24.r,
                  width: 24.r,
                  alignment: Alignment.center,
                  decoration:const BoxDecoration().circle().customColor(Colors.white).shadow(),
                  child: Text('+',style: const TextStyle().semiBoldStyle(fontSize: 16).activeColor(),),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onAdd(){
    int value = widget._value+50;

    if(value<1000 ){
      setState(() {_value =value;});
      if(widget._onUpdate!=null)  widget._onUpdate!(value);
    }

  }


  _onSup(){
    int value = widget._value-50;

    if(value>=0){
     setState(() {_value =value;});
     if(widget._onUpdate!=null)  widget._onUpdate!(value);
    }
  }
}
