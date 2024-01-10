import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

class PriceConverter {


  static String convertPrice(var val, {bool showCurrency = true}) {
    try {
      double? price = double.tryParse((val??"0").toString());

      var f = NumberFormat("#,##0", "en_US");
      if (showCurrency) {
        return '${tr(LocaleKeys.currency)} ${f.format(price)}  ';
      } else {
        return f.format(price);
      }
    } catch (e) {
      return '${tr(LocaleKeys.currency)} ${val??0} ';
    }
  }

  static double convertWithDiscount(BuildContext context, double price, double discount, String discountType) {
    if (discountType == 'amount') {
      price = price - discount;
    } else if (discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(
      double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount') {
      calculatedAmount = discount * quantity;
    } else if (type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price,
      double discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : tr(LocaleKeys.currency)} OFF';
  }
}

double convertToDouble(var d) => d / 1;
int convertToInt(double d) => (d).round();
