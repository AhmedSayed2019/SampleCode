import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:base_app/core/res/resources.dart';


class CustomListAnimator extends StatefulWidget {
  final List<Widget>? children;
  final int? duration;
  final double? verticalOffset;
  final ScrollPhysics? physics;
  final Axis scrollDirection;

  const CustomListAnimator({
    Key? key,
    this.children,
    this.duration,
    this.scrollDirection = Axis.vertical,

    this.verticalOffset,
    this.physics,
  }) : super(key: key);

  @override
  _CustomListAnimatorState createState() => _CustomListAnimatorState();
}

class _CustomListAnimatorState extends State<CustomListAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: AnimationLimiter(
            child: ListView.separated(

              scrollDirection: widget.scrollDirection,
              itemCount: widget.children!.length,
              physics: widget.physics,
              itemBuilder: (_, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,

                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(

                      child: widget.children![index],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return widget.scrollDirection == Axis.vertical
                    ? const SizedBox(height: kFormPaddingVertical,)
                    : const SizedBox(width: kFormPaddingHorizontal,);
              },
            ),
          ),
        ),
      ),
    );
  }
}
