

import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/app_urls/app_url.dart';

class Constants {
  static const String empty = "";
  static const int connectTimeout = 30000;



}
double convertToDouble(var d) => d / 1 ;

String convertListToString(List<String?> list) =>list.join(',');



enum GenderEnum{ male , female }




EdgeInsets kScreenPadding = EdgeInsets.all(kScreenPaddingNormal.r).copyWith(top: 0);

