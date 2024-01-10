import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/domain/entities/countries/country_entity.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:flutter/material.dart';






class CountryItem extends StatelessWidget {


  final CountryEntity _entity ;
  final bool _isLast ;


  const CountryItem({super.key,
    required CountryEntity entity, required bool isLast,
  }) : _entity = entity,_isLast = isLast;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:_isLast?null:  BoxDecoration(  border: Border(
        bottom: BorderSide(width: 1.0, color: Theme.of(context).hoverColor),
      ),),
      padding: EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge.w),
      child: Column(
        children: [
          VerticalSpace(kFormPaddingAllSmall.h),

          Row(
            children: [
            Expanded(child: Align(alignment: Alignment.center,child: Text(_entity.name,style: const TextStyle().semiBoldStyle(fontSize: 12).ellipsisStyle()))),
            Expanded(child: Align(alignment: Alignment.center,child: Text(_entity.capital,style: const TextStyle().regularStyle(fontSize: 12).ellipsisStyle()))),
            ],
          ),
          VerticalSpace(kFormPaddingAllSmall.h),
          // if(!_isLast)const CustomDivider(),
          // VerticalSpace(kFormPaddingAllSmall.h),

        ],
      ),
    );
  }
}
