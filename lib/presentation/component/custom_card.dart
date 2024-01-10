import 'package:flutter/material.dart';

import '../../core/res/resources.dart';

class CustomCard extends StatelessWidget {
  final Widget _child;
  final double? _radius;
  final Color? _color;
  final Color? _shadowColor;
  final double? _elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_radius??kFormRadiusSmall))),
      shadowColor: _shadowColor,
      elevation: _elevation,
      color: _color??Theme.of(context).highlightColor, //Colors.white,
      surfaceTintColor: _color,

      child: _child,
    );
  }

  const CustomCard({super.key,
    required Widget child,
     double? radius,
     Color? color,
     Color? shadowColor,
     double? elevation = 1,
  })  : _child = child,
        _radius = radius,
        _color = color,
        _shadowColor = shadowColor,
        _elevation = elevation;
}
