import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget _child;
  final bool _isDark;
  final Color? _color;
  const StatusBar({super.key,
    required Widget child,
     bool isDark= false,
     Color? color,
  })  : _child = child,
        _isDark = isDark,
        _color = color;



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(

        statusBarColor:_color??  Theme.of(context).primaryColorDark,
        statusBarIconBrightness: _isDark ? Brightness.dark : Brightness.light,
        statusBarBrightness: _isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Theme.of(context).primaryColorDark,
        systemNavigationBarIconBrightness:  _isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: Theme.of(context).primaryColor,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      ),
      child: _child,
    );
  }


}
