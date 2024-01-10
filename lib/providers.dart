


import 'package:base_app/core/utils/timer_helper.dart';
import 'package:base_app/domain/provider/local_auth_provider.dart';
import 'package:base_app/presentation/modules/auth/register/register_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/countries/countries_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/home/home_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/services/services_view_model.dart';
import 'package:base_app/presentation/modules/layout/layout_view_model.dart';
import 'package:base_app/presentation/sheets/gender_picker/gender_picker_view_model.dart';
import 'package:base_app/presentation/sheets/skills_picker/skills_picker_view_model.dart';
import 'package:base_app/presentation/sheets/user_types_picker/user_types_picker_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'data/injection.dart';
import 'presentation/modules/auth/login/login_view_model.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Locale
        ChangeNotifierProvider(create: (_) => getIt<LocalAuthProvider>()),

        ///Auth
        ChangeNotifierProvider(create: (_) => getIt<LoginViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<RegisterViewModel>()),


        ///Common
        ChangeNotifierProvider(create: (_) => getIt<TimerHelper>()),



        ///Main
        ChangeNotifierProvider(create: (_) => getIt<CustomerLayoutViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<CustomerHomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<CountriesViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ServicesViewModel>()),


        ///sheet
        ChangeNotifierProvider(create: (_) => getIt<UserTypesPickerViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<GenderPickerViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<SkillsPickerViewModel>()),



      ],
      child: child,
    );
  }
}
