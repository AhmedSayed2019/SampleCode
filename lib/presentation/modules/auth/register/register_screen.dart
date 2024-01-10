
import 'package:base_app/presentation/modules/auth/register/steps/register_step_one.dart';
import 'package:base_app/presentation/modules/auth/register/steps/register_step_two.dart';
import 'package:base_app/presentation/modules/auth/register/widgets/step_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/navigation_services.dart';
import '../../../../core/utils/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../component/component.dart';
import 'register_view_model.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({super.key});


 @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();


}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {


  late RegisterViewModel _viewModel;
  late PageController _controller;

  @override
  void initState() {

    super.initState();
    _viewModel=  Provider.of<RegisterViewModel>(context,listen: false);
    _controller = PageController(initialPage: _viewModel.currentPage);
    _viewModel.init(_controller);

  }

  @override
  void dispose() {
    super.dispose();
  }
  bool _onBack(int currentPage){
    if(currentPage==1) {_viewModel.onOpenNextPage(0); return false;} else{NavigationService.goBack(); return true;}
  }
  //favouriteSocialMedia
  @override
  Widget build(BuildContext context) {
    int currentPage = context.watch<RegisterViewModel>().currentPage;
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar:  CustomAppBar(color: Colors.transparent,title: tr(LocaleKeys.register),onBackPress: ()=> _onBack(currentPage)),
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            children: [
              StepView(stepIndex: currentPage),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: const [RegisterStepOne(), RegisterStepTwo()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
