
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:real_state/providers/sign_up_provider.dart';
import 'package:real_state/utills/conts/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_source/remote/dio/dio_service.dart';
import 'data/data_source/remote/dio/logging_interceptor.dart';
import 'data/repositories/auth/auth_repo.dart';
import 'providers/a_specific_widget_provider.dart';
import 'providers/home_screen_provider.dart';
import 'providers/sign_in_provider.dart';



final sl = GetIt.instance;

Future<void> init() async {

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  //sl.registerFactory(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  if (sl.isRegistered<Dio>()) {
    print("dio is registered");
    print(".....d.........${new Dio()}");
  } else {
    print("dio is not registered");
  }

  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
  //sl.registerLazySingleton(() => DioService(Api.baseUrl, sl<Dio>(), loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerFactory<DioService>(() => DioService(Api.baseUrl, sl<Dio>(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(dioService: sl(), sharedPreferences: sl()));


  /// Provider
  sl.registerFactory<SignUpProvider>(() => SignUpProvider(dioService: sl(), auth: sl()));
  sl.registerFactory<SignInProvider>(() => SignInProvider(dioService: sl(), auth: sl()));
  sl.registerFactory<ASpecificWidgetProvider>(() => ASpecificWidgetProvider());
  sl.registerFactory<HomeScreenProvider>(() => HomeScreenProvider());



}