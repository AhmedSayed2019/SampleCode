import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/price_converter.dart';
import 'package:base_app/domain/entities/countries/country_entity.dart';
import 'package:base_app/domain/entities/service_entity.dart';
import 'package:base_app/generated/assets.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:flutter/material.dart';






class ServiceItem extends StatelessWidget {


  final ServiceEntity _entity ;


  const ServiceItem({super.key,
    required ServiceEntity entity
  }) : _entity = entity;

  

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.white,
      child: Container(
        height: 192.h,
        width: 157.w,
        decoration: BoxDecoration(  border: Border(bottom: BorderSide(width: 1.0, color: Theme.of(context).hoverColor))),

        child: Column(
          children: [

            Stack(
              children: [
                CustomImage(imageUrl: _entity.mainImage,height: 103.h, width: 157.w),
                Positioned(
                  bottom: kFormPaddingAllSmall.h,
                  left: kFormPaddingAllSmall.w,

                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(kFormRadiusLarge),
                          left: Radius.circular(kFormRadiusLarge),
                        ),
                        // border: Border.symmetric(horizontal: BorderSide(width: 1.0, color: Theme.of(context).hoverColor))
                    ),
                    child: Text(PriceConverter.convertPrice(_entity.price), style: const TextStyle().semiBoldStyle(fontSize: 12).colorWhite().ellipsisStyle(), maxLines: 2),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge.w),
              child: Column(
                children: [
                  VerticalSpace(kFormPaddingAllSmall.h),
                  Text(_entity.title,textDirection:TextDirection.rtl ,style: const TextStyle().titleStyle(fontSize: 12).ellipsisStyle(),maxLines: 2,),

                  VerticalSpace(kFormPaddingAllSmall.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRateView(rating: _entity.averageRating),
                      HorizontalSpace(kFormPaddingAllLarge.w),
                      CustomDivider(height: 16.h,width: 1,color: const Color(0xff828282)),
                      HorizontalSpace(kFormPaddingAllLarge.w),
                      CustomIconText(title:  _entity.completedSalesCount.toString(),textStyle:const TextStyle().semiBoldStyle(fontSize: 10).customColor(const Color(0xff828282)), svgIcon: Assets.iconsOrderCountIcon)

                    ],
                  ),
                  VerticalSpace(kFormPaddingAllSmall.h),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
