import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/decoration.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool _value;
  final ValueChanged<bool> _onChanged;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();

  const CustomSwitch({super.key,
    required bool value,
    required ValueChanged<bool> onChanged,
  })  : _value = value,
        _onChanged = onChanged;
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget._value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget._value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget._onChanged( !widget._value);

          },
          child: Container(
            width: 45.0.w,
            height: 24.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft ? Theme.of(context).hintColor : Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kFormPaddingAllSmall),
              child: Container(
                alignment:
                widget._value ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft ) : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration:const BoxDecoration().circle().customColor(Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}