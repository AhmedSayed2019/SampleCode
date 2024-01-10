


import 'package:base_app/core/utils/remember_me/remember_me_helper.dart';
import 'package:base_app/domain/injection.dart';
import 'package:base_app/presentation/modules/auth/login/login_view_model.dart';
import 'package:base_app/presentation/modules/auth/register/register_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/countries/countries_view_model.dart';

import 'package:base_app/presentation/modules/layout/children/home/home_view_model.dart';
import 'package:base_app/presentation/modules/layout/children/services/services_view_model.dart';
import 'package:base_app/presentation/modules/layout/layout_view_model.dart';
import 'package:base_app/presentation/sheets/gender_picker/gender_picker_view_model.dart';
import 'package:base_app/presentation/sheets/skills_picker/skills_picker_view_model.dart';

import 'package:base_app/presentation/sheets/user_types_picker/user_types_picker_view_model.dart';


import 'data/injection.dart';
import 'domain/provider/local_auth_provider.dart';


Future<void> initInjection() async {
  ///Base
  initBaseData();
  initBaseDomain();
  initBasePresentation();
}

Future<void> initBasePresentation() async {


  ///Auth
  getIt.registerLazySingleton(() => LocalAuthProvider(clearUserDataUseCase: getIt(),isUserLoginUseCase: getIt(),getProfileUseCase: getIt()));
  getIt.registerLazySingleton(() => RememberMeHelper(getIsRememberMeUseCase: getIt(), saveIsRememberUseCase: getIt(), getLoginDataUseCase: getIt(), saveLoginDataUseCase: getIt()));


  ///Auth
  getIt.registerLazySingleton(() => LoginViewModel(saveUserDataUseCase: getIt(),rememberMeHelper: getIt(),signInUseCase: getIt()));
  getIt.registerLazySingleton(() => RegisterViewModel(registerUseCase:  getIt(),getDependenciesUseCase:  getIt()));

  getIt.registerLazySingleton(() => CustomerLayoutViewModel());
  getIt.registerLazySingleton(() => CustomerHomeViewModel());
  getIt.registerLazySingleton(() => CountriesViewModel(getCountriesUseCase: getIt()));
  getIt.registerLazySingleton(() => ServicesViewModel(getPopularServicesUseCase: getIt(),getServicesUseCase:  getIt()));


  ///sheet
  getIt.registerLazySingleton(() => UserTypesPickerViewModel(getUserTypesUseCase: getIt()));
  getIt.registerLazySingleton(() => GenderPickerViewModel());
  getIt.registerLazySingleton(() => SkillsPickerViewModel(getSkillsUseCase: getIt()));



}
