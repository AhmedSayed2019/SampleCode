import 'package:flutter/material.dart';
import 'package:base_app/core/utils/globals.dart';

class NotAuthStatusView extends StatelessWidget {
  final Widget _widget;
  final Widget _notAuthWidget;

  const NotAuthStatusView({super.key,
    required Widget child,
    required Widget notAuthWidget,
  })  : _widget = child,
        _notAuthWidget = notAuthWidget;
  @override
  Widget build(BuildContext context) {
    return  kIsAuth?_widget:  _notAuthWidget;
  }

}
