
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/core/utils/globals.dart';
import 'package:base_app/domain/entities/dependency_entity.dart';
import 'package:base_app/domain/entities/profile_entity.dart';
import 'package:base_app/generated/locale_keys.g.dart';
import 'package:base_app/presentation/component/selector/gender_selector_widget.dart';
import 'package:base_app/presentation/dialog/show_logout_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../component/component.dart';
import '../../../../component/selector/salary_selector_widget.dart';
import '../../../../component/selector/user_types_selector_widget.dart';
import '../../../auth/register/widgets/skills_selector.dart';
import '../../../auth/register/widgets/social_media_view.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController ;
  late TextEditingController _emailController ;
  late TextEditingController _passwordController ;
  late TextEditingController _birthDateController;
  late TextEditingController _aboutController ;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDateController = TextEditingController();
    _aboutController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    _aboutController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    ProfileEntity parameters = kUser! ;
    return Scaffold(
      primary: false,
      appBar: CustomAppBar(
        title: tr(LocaleKeys.whoAmI),
        elevation: 0,
        isBackButtonExist: false,
        actions: [
          PopupMenuButton<int>(
            color: Colors.white,
            onSelected: (item) =>showCustomDialogLogout(context),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text(tr(LocaleKeys.logout))),
            ],
          ),

        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(kScreenPaddingNormal.r),
        child: CustomListAnimator(
          children:  [
            CustomPersonImage(imageUrl: parameters.avatar ,size: 70.r,),

            Row(
              children: [
                Expanded(child: CustomTextFieldNormal(controller: _firstNameController, label: tr(LocaleKeys.firstName),validateMassage: tr(LocaleKeys.msgFirstNameRequired),textInputAction: TextInputAction.next,defaultValue:parameters.firstName)),
                HorizontalSpace(kFormPaddingAllLarge.w),
                Expanded(child: CustomTextFieldNormal(controller: _lastNameController, label: tr(LocaleKeys.lastName),validateMassage: tr(LocaleKeys.msgLastNameRequired),textInputAction: TextInputAction.next,defaultValue:parameters.lastName)),
              ],
            ),
            CustomTextFieldEmail(label: tr(LocaleKeys.email),controller: _emailController,textInputAction: TextInputAction.next,defaultValue:parameters.email),

            UserTypesSelectorWidget(selectedValue: parameters.userType),

            CustomTextFieldArea(label: tr(LocaleKeys.about),controller: _aboutController,textInputAction: TextInputAction.next,defaultValue:parameters.about),

            SalaryWidget(value: parameters.salary),

            CustomTextFieldDate(controller: _birthDateController,label: tr(LocaleKeys.birthDate),defaultValue: parameters.birthDate,calendarStartDate: DateTime.now().subtract(const Duration(days: 1))),

            GenderSelectorWidget(onSelected: (v){}, selectedValue:parameters.gender),

            if (parameters.favoriteSocialMedia.isNotEmpty)
              SocialMediaView(list: parameters.favoriteSocialMedia.map((e) => DependencyEntity(id: e.toLowerCase(), name: e)).toList() ,selected: parameters.favoriteSocialMedia.map((e) => DependencyEntity(id: e.toLowerCase(), name: e)).toList(),onSelected: (v,s){}),


            if (parameters.skills.isNotEmpty) ...[
              SkillsSelectorView(list: parameters.skills ,isMultipleSelection: true,selected: parameters.skills),
              const VerticalSpace(kScreenPaddingNormal),
            ],

          ],
        ),

      ),
    );
  }

}
