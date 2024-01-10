
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


@immutable
class NavigationTabData {
  const NavigationTabData({
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.initialRoute,
    required this.index,
  });

  final String title;
  final String selectedIcon;
  final String unSelectedIcon;
  final Widget initialRoute;
  final int index;
}
