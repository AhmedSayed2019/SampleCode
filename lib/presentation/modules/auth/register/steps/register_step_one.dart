
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:base_app/presentation/component/selector/user_types_selector_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/resources.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../register_view_model.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({super.key});

 @override
  State<RegisterStepOne> createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController  = TextEditingController();
  final TextEditingController _confirmPasswordController  = TextEditingController();
  final TextEditingController _emailController  = TextEditingController();
  final TextEditingController _passwordController  = TextEditingController();

  // _firstNameController = TextEditingController();
  // _lastNameController = TextEditingController();
  // _confirmPasswordController = TextEditingController();
  // _emailController = TextEditingController();
  // _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late RegisterViewModel _viewModel;


  void _onSubmit(context) async {
    bool isUserTypeValid = _viewModel.checkUserTypeError();
    FocusScope.of(context).unfocus();
    if ( _formKey.currentState != null) {
      if (_formKey.currentState!.validate() && isUserTypeValid /*&& isTermsValid && isCityValid && isRegionValid*/) {
        _formKey.currentState!.save();
        String firstName = _firstNameController.text;
        String lastName = _lastNameController.text;
        String email = _emailController.text;
        String password = _passwordController.text;
        _viewModel.saveStepOneData(firstName: firstName, lastName: lastName, email: email, password: password);
      }
    }
  }

  @override
  void initState() {
    // _firstNameController = TextEditingController();
    // _lastNameController = TextEditingController();
    // _confirmPasswordController = TextEditingController();
    // _emailController = TextEditingController();
    // _passwordController = TextEditingController();
    super.initState();
    _viewModel=  Provider.of<RegisterViewModel>(context,listen: false);
  }

  @override
  void dispose() {
    // _firstNameController.dispose();
    // _lastNameController.dispose();
    // _confirmPasswordController.dispose();
    // _emailController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegisterParameters parameters = context.watch<RegisterViewModel>().parameters;
    bool isLoading = context.watch<RegisterViewModel>().isLoading;

    return Column(
      children: [
        Expanded(
          child: CustomListAnimator(
            children: [
              _buildForm(parameters),
              VerticalSpace(kScreenPaddingNormal.h),
            ],
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            width: 160.w,
            loading: isLoading,
            onTap: () => _onSubmit(context),
            isRounded: true,
            title: tr(LocaleKeys.next),
          ),
        ),
        VerticalSpace(kScreenPaddingNormal.h),
      ],
    );
  }
  _buildForm(RegisterParameters parameters ){
    String? userTypeError = context.watch<RegisterViewModel>().userTypeError;

    return Form(key: _formKey,child: Container(
      decoration: const BoxDecoration().customColor(Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)).radius(),
      padding: EdgeInsets.all(kFormPaddingAllLarge.r),

      child: Column (

        children: [
          VerticalSpace(kScreenPaddingNormal.h),
          Row(
            children: [
              Expanded(child: CustomTextFieldNormal(controller: _firstNameController, label: tr(LocaleKeys.firstName),validateMassage: tr(LocaleKeys.msgFirstNameRequired),textInputAction: TextInputAction.next,defaultValue:parameters.firstName)),
              HorizontalSpace(kFormPaddingAllLarge.w),
              Expanded(child: CustomTextFieldNormal(controller: _lastNameController, label: tr(LocaleKeys.lastName),validateMassage: tr(LocaleKeys.msgLastNameRequired),textInputAction: TextInputAction.next,defaultValue:parameters.lastName)),
            ],
          ),
          VerticalSpace(kScreenPaddingNormal.h),
          CustomTextFieldEmail(label: tr(LocaleKeys.email),controller: _emailController,textInputAction: TextInputAction.next,defaultValue:parameters.email),
          VerticalSpace(kScreenPaddingNormal.h),

          CustomTextFieldPassword(controller: _passwordController, defaultValue:parameters.password),
          VerticalSpace(kScreenPaddingNormal.h),
          CustomTextFieldPassword(
            controller: _confirmPasswordController,
            defaultValue: parameters.password,
            label: tr(LocaleKeys.confirmPassword),
            validateFunc: (value) {
              if ((value ?? '').isEmpty) {
                return tr(LocaleKeys.msgConfirmPasswordRequired);
              } else if (value != _passwordController.text) {
                return tr(LocaleKeys.confirmPasswordDoesNotMatchPassword);
              }
            },
          ),
          VerticalSpace(kScreenPaddingNormal.h),
          UserTypesSelectorWidget(onSelected: _viewModel.onUpdateUserType,selectedValue: parameters.userType,error: userTypeError),
          VerticalSpace(kScreenPaddingNormal.h),

        ],
      ),
    ));
  }
}
