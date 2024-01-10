import 'package:base_app/core/res/resources.dart';
import '../../../../core/routing/routes.dart';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/routing/navigation_services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';


import '../../../../generated/assets.dart';
import '../../../../generated/locale_keys.g.dart';

import '../../../../domain/parameters/auth/login_parameters.dart';
import '../../../component/component.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginViewModel _viewModel;


  void _onSubmit(context) async {

    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String email = _emailController.text;
        String password = _passwordController.text;

        _viewModel.login(email, password).then((response){
          if(response.isSuccess){
                NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen);
          }
        });
      }
    }
  }
  init() async {
    await _viewModel.init();
    _emailController.text = _viewModel.parameters.email ?? '';
    _passwordController.text = _viewModel.parameters.password ?? '';
  }

  @override
  void initState() {
    if (kDebugMode) {
      _emailController.text = 'samer@gmail.com';
      _passwordController.text = '123123123';
    }
    super.initState();
    _viewModel = Provider.of<LoginViewModel>(context, listen: false);
    init();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<LoginViewModel>().isLoading;

    return CustomScaffold(
      appBar: const CustomAppBar(isBackButtonExist: false),
      body: Padding(
        padding: const EdgeInsets.all(kScreenPaddingNormal),
        child: CustomListAnimator(
          children: [
            SvgPicture.asset(Assets.svgLoginImage),
            VerticalSpace(kFormPaddingAllSmall.h),
            _buildForm(),
            // VerticalSpace(kScreenPaddingNormal.h),
            CustomButton(
              onTap: () => _onSubmit(context),
              loading: isLoading,
              title: tr(LocaleKeys.login),
            ),
            Center(
              child: TextClickWidget(
                  text: '${tr(LocaleKeys.questionCreateAccount)} ',
                  subText: tr(LocaleKeys.register),
                  onTap: () => Navigator.pushNamed(context, Routes.registerScreen)
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildForm() {
    LoginParameters parameters = context.watch<LoginViewModel>().parameters;
    bool isRememberMeEnable = context.watch<LoginViewModel>().isRememberMeEnable;

    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration().customColor(Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)).radius(),
         padding: EdgeInsets.all(kFormPaddingAllLarge.r),
        child: Column(
          children: [
            CustomTextFieldEmail(
              controller: _emailController,
              defaultValue: parameters.email,
            ),

            VerticalSpace(kScreenPaddingNormal.h),
            CustomTextFieldPassword(
              label: tr(LocaleKeys.passwordHint),
              controller: _passwordController,
              defaultValue: parameters.password,
            ),
            // VerticalSpace(kFormPaddingAllLarge.h),

            Row(
              children: [
                Checkbox(value: isRememberMeEnable, onChanged: _viewModel.onUpdateRememberMeEnable, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                Expanded(child: Text(tr(LocaleKeys.rememberMe),style:const TextStyle().regularStyle(fontSize: 12).colorHint())),
                Text(tr(LocaleKeys.forgetPassword),style:const TextStyle().regularStyle(fontSize: 12).colorHint()),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
