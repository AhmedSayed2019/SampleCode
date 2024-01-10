import 'package:auto_size_text/auto_size_text.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/utils/timer_helper.dart';
import '../../generated/locale_keys.g.dart';
import 'component.dart';

class CustomTimerView extends StatefulWidget {
  final String _endDate ;

  const CustomTimerView({super.key,
    required String endDate,
  }) : _endDate = endDate;

  @override
  State<CustomTimerView> createState() => _CustomTimerViewState();
}

class _CustomTimerViewState extends State<CustomTimerView> {
  @override
  void initState() {
    Provider.of<TimerHelper>(context, listen: false).startTimer(widget._endDate);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<String>? timerValues = context.watch<TimerHelper>().timerValues;

    return (timerValues ?? []).isEmpty
        ? const SizedBox()
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: _buildItem(type: tr(LocaleKeys.days), value: timerValues![0]),),

        HorizontalSpace(kScreenPaddingNormal.w),
        Expanded(child:  _buildItem(type: tr(LocaleKeys.hours), value: timerValues[1]),),

        HorizontalSpace(kScreenPaddingNormal.w),
        Expanded(child:  _buildItem(type: tr(LocaleKeys.minutes), value: timerValues[2]),),

        HorizontalSpace(kScreenPaddingNormal.w),
        Expanded(child:   _buildItem(type: tr(LocaleKeys.seconds), value: timerValues[3]),),

        // HorizontalSpace(kScreenPaddingNormal.w),
        // Expanded(child:   _buildItem(type: tr(LocaleKeys.seconds), value: timerValues[3]),),

      ],
    );
  }

  _buildItem({required String type, required String? value}) {
    return Container(

      decoration: const BoxDecoration().radius(),
      padding:  EdgeInsets.all(kFormPaddingAllLarge.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeText(value ?? '', style: const TextStyle().titleStyle(fontSize: 20).colorWhite(),maxLines: 1),
          AutoSizeText(type, style: const TextStyle().regularStyle(fontSize: 12).colorWhite(),maxLines: 1),
          // FittedBox(fit: BoxFit.scaleDown,child: Text(type, style: const TextStyle().regularStyle(fontSize: 12).colorWhite())),
        ],
      ),
    );
  }
}
