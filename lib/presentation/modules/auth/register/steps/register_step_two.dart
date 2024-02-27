
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/data/model/base/response_model.dart';
import 'package:base_app/domain/entities/dependencies_entity.dart';
import 'package:base_app/domain/parameters/auth/user_register_parameters.dart';
import 'package:base_app/presentation/component/selector/gender_selector_widget.dart';
import 'package:base_app/presentation/component/selector/salary_selector_widget.dart';
import 'package:base_app/presentation/component/selector/skills_selector_widget.dart';
import 'package:base_app/presentation/modules/auth/register/widgets/social_media_view.dart';
import '../../../../../../core/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/resources.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../generated/locale_keys.g.dart';

import '../../../../component/component.dart';
import '../register_view_model.dart';

class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({super.key});


 @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();


}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
  final TextEditingController _birthDateController= TextEditingController();
  final TextEditingController _aboutController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  late RegisterViewModel _viewModel;




  void _onSubmit(context) async {
    bool isImageValid = _viewModel.checkImageError();
    bool isSocialValid = _viewModel.checkSocialError();
    bool isSkillsValid = _viewModel.checkSkillsError();

    FocusScope.of(context).unfocus();
    if ( _formKey.currentState != null) {
      if (_formKey.currentState!.validate() && isImageValid && isSocialValid && isSkillsValid /*&& isTermsValid && isCityValid && isRegionValid*/) {
        _formKey.currentState!.save();
        String birthDate = _birthDateController.text;
        String about = _aboutController.text;

        _viewModel.saveStepTwoData(birthDate: birthDate, about: about);

        _viewModel.register().then((response) {
          if (response.isSuccess) {
            NavigationService.push(Routes.loginScreen);
          }
        });
      }
    }
  }

  @override
  void initState() {

    super.initState();
    _viewModel=  Provider.of<RegisterViewModel>(context,listen: false);
  }



  @override
  Widget build(BuildContext context) {
    RegisterParameters parameters = context.watch<RegisterViewModel>().parameters;
    bool isLoading = context.watch<RegisterViewModel>().isLoading;


    return WillPopScope(
      onWillPop: ()async{
        _viewModel.saveStepTwoData(birthDate: _birthDateController.text, about: _aboutController.text);
        _viewModel.onOpenNextPage(0);
       return false;
      },
      child: Column(
        children: [
          Expanded(
            child: CustomListAnimator(
              children: [
                _buildForm(parameters),
                VerticalSpace(kScreenPaddingNormal.h),
              ],
            ),
          ),

          CustomButton(
            loading: isLoading,
            onTap: () => _onSubmit(context),
            isRounded: true,
            title: tr(LocaleKeys.submit),
          ),
          VerticalSpace(kScreenPaddingNormal.h),
        ],
      ),
    );
  }

  _buildForm(RegisterParameters parameters ){
    ResponseModel<DependenciesEntity>?  responseModel = context.watch<RegisterViewModel>().responseModel;
    String? imageError = context.watch<RegisterViewModel>().imageError;
    String? skillsError = context.watch<RegisterViewModel>().skillsError;
    String? socialError = context.watch<RegisterViewModel>().socialError;
    return Form(key: _formKey,child: Container(
      decoration: const BoxDecoration().customColor(Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)).radius(),
      padding: EdgeInsets.all(kFormPaddingAllLarge.r),

      child: Column (

        children: [
          CustomPersonImage(onAttachImage: _viewModel.onUpdateImage,canEdit: true,imageUrl: parameters.image ,size: 76.r,error: imageError),


          VerticalSpace(kScreenPaddingNormal.h),
          CustomTextFieldArea(label: tr(LocaleKeys.about),controller: _aboutController,textInputAction: TextInputAction.next,defaultValue:parameters.about),

          VerticalSpace(kScreenPaddingNormal.h),
          SalaryWidget(onUpdate: _viewModel.onUpdateSalary, value: parameters.salary),
          VerticalSpace(kScreenPaddingNormal.h),


          CustomTextFieldDate(controller: _birthDateController,label: tr(LocaleKeys.birthDate),defaultValue: parameters.birthDate,calendarEndDate: DateTime.now().subtract(const Duration(days: 1))),
          VerticalSpace(kScreenPaddingNormal.h),
          GenderSelectorWidget(onSelected: _viewModel.onUpdateGender, selectedValue:parameters.gender),

          const VerticalSpace(kScreenPaddingNormal),
          SkillsSelectorWidget(onSelectList: _viewModel.onSelectSkills, selectedList:parameters.skills,error: skillsError),

          const VerticalSpace(kScreenPaddingNormal),
          if(( responseModel?.data?.skillsList??[]).isNotEmpty)...[
            const VerticalSpace(kScreenPaddingNormal),
            SocialMediaView(list: responseModel!.data!.socialMediaList ,selected: parameters.socialMedia,onSelected:  _viewModel.onSelectSocialMedia,error: socialError),
            // const VerticalSpace(kScreenPaddingNormal),
            // SkillsSelectorView(list: responseModel.data!.skillsList ,isMultipleSelection: true,selected: parameters.skills,onSelected:  _viewModel.onSelectSkill,error: skillsError),
            // const VerticalSpace(kScreenPaddingNormal),
          ],


        ],
      ),
    ));
  }
}
