
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:real_state/providers/sign_up_provider.dart';
import 'package:real_state/utills/conts/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_source/remote/dio/dio_service.dart';
import 'data/data_source/remote/dio/logging_interceptor.dart';
import 'data/repositories/auth/auth_repo.dart';



final sl = GetIt.instance;

Future<void> init() async {

  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioService(Api.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerLazySingleton(() => AuthRepo(dioService: sl(), sharedPreferences: sl()));


  /// Provider
  sl.registerFactory(() => SignUpProvider(dioService: sl(), auth: sl()));
  sl.registerFactory(() => SignUpProvider(dioService: sl(), auth: sl()));


  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}