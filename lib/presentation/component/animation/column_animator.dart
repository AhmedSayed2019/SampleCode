import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:base_app/core/res/resources.dart';

import '../../../../core/res/values_manager.dart';
import '../component.dart';


class ColumnAnimator extends StatefulWidget {
  final List<Widget>? _children;

  @override
  _ColumnAnimatorState createState() => _ColumnAnimatorState();

  const ColumnAnimator({super.key,
    required List<Widget>? children,
  }) : _children = children;
}

class _ColumnAnimatorState extends State<ColumnAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: AnimationLimiter(
            child: SingleChildScrollView(
              child: Column(
                children:  List.generate(
                  (widget._children??[] ).length,
                      (index) =>Column(
                        children: [
                          const VerticalSpace( kFormPaddingVertical),
                          widget._children![index]
                        ],
                      )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
