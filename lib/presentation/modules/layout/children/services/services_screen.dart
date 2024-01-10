import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/entities/service_entity.dart';
import 'package:base_app/generated/assets.dart';
import 'package:base_app/presentation/modules/layout/children/services/services_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/services/widget/service_item.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/constants.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../component/component.dart';




_getData(BuildContext context,bool reload)=>
    Provider.of<ServicesViewModel>(context, listen: false).getData(reload: reload);


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late ServicesViewModel _viewModel;


  @override
  void initState() {
    _viewModel = Provider.of<ServicesViewModel>(context,listen: false);
    super.initState();
    _getData(context,false);
  }

  @override
  Widget build(BuildContext context) {
    ResponseModel<List<ServiceEntity>>? responseModel = context.watch<ServicesViewModel>().responseModel;
    ResponseModel<List<ServiceEntity>>? popularResponseModel = context.watch<ServicesViewModel>().popularResponseModel;


    return Scaffold(
      appBar: const CustomAppBar(isBackButtonExist: false),
      body: Padding(
        padding: kScreenPadding,
        child: RefreshIndicator(
          onRefresh: () async=> _getData(context ,true),
          child:ScreenStateLayout(
              onRetry: () => _getData(context, true),
              noDataBuilder: (context) => NoDataScreen(imageSvg: Assets.noDataRequestsNoData,title: tr(LocaleKeys.makeYourRequest),),
              isLoading: responseModel == null ,
              isEmpty:(responseModel?.data??[]).isEmpty,
              builder: (context) => CustomListAnimator(

              children: [

                Text(tr(LocaleKeys.services),style: const TextStyle().titleStyle(),),
                SizedBox(
                  height: 192.h,
                  child: CustomListAnimatorData(
                    itemCount: responseModel?.data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ServiceItem(entity: responseModel!.data![index]),
                  ),
                ),
                VerticalSpace(kFormPaddingAllLarge.h),
                Text(tr(LocaleKeys.popularServices),style: const TextStyle().titleStyle(),),

                SizedBox(
                  height: 192.h,
                  child: CustomListAnimatorData(
                    itemCount: responseModel?.data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ServiceItem(entity: responseModel!.data![index]),
                  ),
                ),


            ]),
          ),
        ),
      ),
    );
  }
}