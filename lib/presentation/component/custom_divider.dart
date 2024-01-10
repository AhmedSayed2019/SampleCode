import 'package:flutter/material.dart';

import '../../../../core/res/resources.dart';

class CustomDivider extends StatelessWidget {
  final double  _height ;
  final double?  _width ;
  final Color?  _color ;
  const CustomDivider({
    super.key,
    double? height = 0.5,
    double? width,
    Color? color,
  })  : _height = height ?? 0.5,
        _width = width,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width??deviceWidth,
      color:_color?? Theme.of(context).hintColor,
    );
  }


}
class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}