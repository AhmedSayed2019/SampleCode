import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
enum Type{ current , next,done }

class StepView extends StatelessWidget {
  final int _stepIndex;
  const StepView({super.key,
    required int stepIndex,
  }) : _stepIndex = stepIndex;


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Text(
              tr(LocaleKeys.register),
              style: const TextStyle().semiBoldStyle(fontSize: 12).copyWith(fontSize: 12.sp,).activeColor(),
            ),
            const Expanded(flex: 2,child: SizedBox()),

            Text(
              tr(LocaleKeys.completeData),
              textAlign: TextAlign.center,
              style: const TextStyle().semiBoldStyle(fontSize: 12).customColor( _stepIndex==1 ? Theme.of(context).primaryColor : Theme.of(context).hintColor),
            ),
            const Expanded(child: SizedBox()),

          ],
        ),
        VerticalSpace(kFormPaddingAllLarge.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: SizedBox(child: Container(height: 3, width: 1, color:  Theme.of(context).primaryColor))),
            _timeLineCheckView(context,_stepIndex==0? Type.current:Type.done,1),
            Expanded(flex: 2,child: SizedBox(child: Container(height: 3, width: 1, color: _stepIndex==1 ? Theme.of(context).primaryColor : Theme.of(context).hoverColor))),
            _timeLineCheckView(context, _stepIndex==0? Type.next:Type.current,2),
            Expanded(child: SizedBox(child: Container(height: 3, width: 1, color:  Theme.of(context).hoverColor))),

            // Expanded(child: SizedBox(child: Container(height: 5, width: 2, color: _stepIndex==3 ? Theme.of(context).primaryColor : Theme.of(context).hintColor))),
            // _timeLineCheckView(context, _stepIndex==3,3),
          ],
        ),

      ],
    );

  }


}

_timeLineCheckView(BuildContext context, Type type, int index) {

return  Container(
    height: 24.r,
    width: 24.r,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: type==Type.next ? Theme.of(context).hoverColor : Theme.of(context).primaryColor, width: 2),
        color:  type==Type.next ? Theme.of(context).hoverColor : type==Type.done ? Theme.of(context).primaryColor : Colors.white,
        shape: BoxShape.circle),
      child: type == Type.current
          ? Text(index.toString(), style: const TextStyle().regularStyle().semiBoldStyle().customColor(Theme.of(context).primaryColor))
          : type == Type.done
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : const SizedBox() ,
);

//isActive
//       ? Text(index.toString(),style: TextStyle().regularStyle(),)//Icon(Icons.check_circle_outlined, color: Theme.of(context).primaryColor, size: 30)
//       :
}
//
// buildTrackOrder(BuildContext context) {
//   bool isActive1 = orderModel!.orderStatus == ApiConstants.statusOrderList[1];
//
//   bool isActive2 = orderModel!.orderStatus == ApiConstants.statusOrderList[1] || orderModel!.orderStatus == ApiConstants.statusOrderList[2];
//
//   bool isActive3 = orderModel!.orderStatus == ApiConstants.statusOrderList[2];
//
// }
