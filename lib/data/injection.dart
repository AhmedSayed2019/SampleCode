

import 'package:base_app/data/repository/service_repository_imp.dart';
import 'package:base_app/data/repository/setting_repository_imp.dart';
import 'package:base_app/domain/repository/auth_repo.dart';
import 'package:base_app/domain/repository/profile_repo.dart';
import 'package:base_app/domain/repository/service_repo.dart';
import 'package:base_app/domain/repository/setting_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/local/cache_consumer.dart';
import '../core/services/network/api_consumer.dart';
import '../core/services/network/network_info.dart';
import '../domain/repository/local_repo.dart';
import 'app_urls/app_url.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/logging_interceptor.dart';
import 'repository/auth_repository_imp.dart';
import 'repository/local_repository_imp.dart';
import 'repository/profile_repository_imp.dart';



final getIt = GetIt.instance;
Future<void> initBaseData() async {
  /// Core
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(), loggingInterceptor: getIt(), cacheConsumer:  getIt()));


  /// Repository
  getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImp(dioClient: getIt(),cacheConsumer: getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(dioClient: getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(dioClient: getIt()));

  getIt.registerLazySingleton<ServiceRepository>(() => ServiceRepositoryImp(dioClient: getIt()));
  getIt.registerLazySingleton<SettingRepository>(() => SettingRepositoryImp(dioClient: getIt()));


  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => CacheConsumer(secureStorage: getIt() ,sharedPreferences: getIt()));



  getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),);
  getIt.registerLazySingleton(() => ApiConsumer(getIt<Dio>(), getIt<PrettyDioLogger>(), getIt()));


}