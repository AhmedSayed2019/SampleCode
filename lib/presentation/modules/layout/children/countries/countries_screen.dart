import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/constants.dart';
import 'package:base_app/domain/entities/countries/countries_entity.dart';
import 'package:base_app/generated/assets.dart';
import 'package:base_app/presentation/modules/layout/children/countries/countries_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/countries/widgets/country_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/data/model/base/response_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../component/component.dart';

_init(BuildContext context, bool reload)=>
  Provider.of<CountriesViewModel>(context, listen: false).init();


_getData(BuildContext context,int page)=>
    Provider.of<CountriesViewModel>(context, listen: false).getCountries(true,page: page);

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {


  @override
  void initState() {
    super.initState();
    _init(context, false);
  }

  @override
  Widget build(BuildContext context) {
    ResponseModel<CountriesEntity>? responseModel = context.watch<CountriesViewModel>().responseModel;
    int currentPage = context.watch<CountriesViewModel>().currentPage;
    bool isLoading = context.watch<CountriesViewModel>().isLoading;

    return Scaffold(
      appBar: CustomAppBar(isBackButtonExist: false, title: tr(LocaleKeys.countries)),
      body: Padding(
        padding: kScreenPadding,
        child: RefreshIndicator(
          onRefresh: () async=>_init(context, true),
          child: ScreenStateLayout(
            isLoading: responseModel==null,
            builder: (context) =>  Column(
              children: [

                CustomCard(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(kFormPaddingAllSmall.r),
                    child: Column(
                      children: [
                        CustomCard(
                          elevation:0,
                          child: Padding(
                            padding: EdgeInsets.all(kFormPaddingAllLarge.r),
                            child: Row(
                              children: [
                                Expanded(child: Align(alignment: Alignment.center,child: Text(tr(LocaleKeys.country),style: const TextStyle().semiBoldStyle(fontSize: 13).ellipsisStyle()))),
                                Expanded(child: Align(alignment: Alignment.center,child: Text(tr(LocaleKeys.capital),style: const TextStyle().regularStyle(fontSize: 13).ellipsisStyle()))),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(kFormPaddingAllLarge.r),
                          child: ScreenStateLayout(
                            onRetry: () => _init(context, true),
                            noDataBuilder: (context) => NoDataScreen(imageSvg: Assets.noDataRequestsNoData,title: tr(LocaleKeys.makeYourRequest),),
                            isLoading: responseModel == null ,
                            isEmpty:(responseModel?.data?.list??[]).isEmpty,
                            builder: (context) =>CustomListAnimatorData(
                              itemCount: responseModel?.data?.list.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => CountryItem(entity: responseModel!.data!.list[index],isLast:responseModel.data!.list[index].id==responseModel.data!.list.last.id),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                VerticalSpace(kFormPaddingAllLarge.h),
                SizedBox(
                  height: 32.h,
                  child: CustomListAnimatorData(
                    itemCount: responseModel?.data?.pagination.totalPages,
                    scrollDirection:Axis.horizontal ,
                      horizontalSpace: kFormPaddingAllSmall.w,
                    itemBuilder: (context, index) => TapEffect(
                      onTap: ()=>_getData(context, index+1),
                      child: Container(
                        height: 32.r,
                        width: 32.r,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration().borderStyle().radius().customColor((currentPage==(index+1))?Theme.of(context).primaryColor:null),
                        child: (isLoading&& currentPage==(index+1))? CustomLoadingSpinner(color: Colors.white,size: 24.r,):Text(
                          (index+1).toString(),
                          style: const TextStyle().semiBoldStyle().customColor(currentPage==(index+1)?Colors.white:null),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//PaginationListView(
//                       onLoadMore: () => _getData(context),
//                       isMoreLoading: isMoreLoading,
//                       list: responseModel?.data?.list??[],
//                       currentPage: currentPage,
//                       hasMorePages:(((responseModel?.data?.list??[]).length) <(responseModel?.data?.pagination.totalPages??0 )),
//                       builder: (context, index) => CountryItem(entity: responseModel!.data!.list[index]),
//                     ),