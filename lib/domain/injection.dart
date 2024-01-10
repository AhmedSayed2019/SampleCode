import 'package:base_app/domain/usecase/common/get_countries_usecase.dart';
import 'package:base_app/domain/usecase/common/get_dependencies_usecase.dart';
import 'package:base_app/domain/usecase/common/get_skills_usecase.dart';
import 'package:base_app/domain/usecase/common/get_user_types_usecase.dart';

import 'package:base_app/domain/usecase/local/clear_user_data_usecase.dart';
import 'package:base_app/domain/usecase/auth/login_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/get_is_remember_me_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/get_login_data_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/save_is_remember_usecase.dart';
import 'package:base_app/domain/usecase/local/remember_me/save_login_data_usecase.dart';
import 'package:base_app/domain/usecase/service/get_popular_services_usecase.dart';
import 'package:base_app/domain/usecase/service/get_services_usecase.dart';



import '../data/injection.dart';

import 'usecase/auth/register_usecase.dart';
import 'usecase/local/get_is_login_usecase.dart';
import 'usecase/local/save_data_usecase.dart';
import 'usecase/profile/get_profile_usecase.dart';



Future<void> initBaseDomain() async {


  ///Locale
  getIt.registerLazySingleton(() => ClearUserDataUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => IsUserLoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => SaveUserDataUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetIsRememberMeUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetLoginDataUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => SaveIsRememberUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => SaveLoginDataUseCase(repository: getIt()));


  ///Common
  getIt.registerLazySingleton(() => GetDependenciesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetUserTypesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetCountriesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetSkillsUseCase(repository: getIt()));

  ///Profile
  getIt.registerLazySingleton(() => GetProfileUseCase(repository: getIt()));

  ///Auth
  getIt.registerLazySingleton(() => LoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(repository: getIt()));

  ///Services
  getIt.registerLazySingleton(() => GetPopularServicesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetServicesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => SaveUserDataUseCase(repository: getIt()));



}