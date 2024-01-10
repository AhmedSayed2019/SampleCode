import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/res/text_styles.dart';

import '../../../core/utils/price_converter.dart';
import '../../../generated/locale_keys.g.dart';

class CustomPriceView extends StatelessWidget {
  final num _value;
  final bool _showCurrency;

  final int? _maxLines;

  final TextStyle? _numberStyle;
  final TextStyle? _currencyStyle;

  const CustomPriceView({
    super.key,
    int? maxLines,
    required num value,
    bool showCurrency = true,
    TextStyle? numberStyle,
    TextStyle? currencyStyle,
  })  : _value = value,
        _showCurrency = showCurrency,
        _maxLines = maxLines,
        _numberStyle = numberStyle,
        _currencyStyle = currencyStyle;

  @override
  Widget build(BuildContext context) {
    return  RichText(
      maxLines: _maxLines,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${PriceConverter.convertPrice(_value)} ',
            style: _numberStyle??const TextStyle().titleStyle(fontSize: 18).heightStyle(height: 1.4),
          ),
          // if(_showCurrency)
          //   TextSpan(
          //     text: tr(LocaleKeys.sar),
          //     style: _currencyStyle??const TextStyle().regularStyle().heightStyle(height: 1.4),
          //   ),
        ],
      ),
    );
  }


}
