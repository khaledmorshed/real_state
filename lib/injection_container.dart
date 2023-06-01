
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:real_state/providers/sign_in_provider.dart';
import 'package:real_state/providers/sign_up_provider.dart';
import 'package:real_state/utills/conts/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_source/remote/dio/dio_service.dart';
import 'data/data_source/remote/dio/logging_interceptor.dart';
import 'data/repositories/auth/auth_repo.dart';



final sl = GetIt.instance;

Future<void> init() async {

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton(sharedPreferences);
  //sl.registerSingleton(Dio());
  sl.registerSingleton(LoggingInterceptor());

  if (sl.isRegistered<Dio>()) {
    print("dio is registered");
    print(".....d.........${new Dio()}");
  } else {
    print("dio is not registered");
  }
  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerSingleton(DioService(Api.baseUrl, sl<Dio>(), loggingInterceptor: sl<LoggingInterceptor>(), sharedPreferences: sl<SharedPreferences>()));
  //sl.registerSingleton(() => DioService(Api.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerSingleton(AuthRepo(dioService: sl<DioService>(), sharedPreferences: sl<SharedPreferences>()));


  /// Provider
  sl.registerSingleton(SignUpProvider(dioService: sl<DioService>(), auth: sl<AuthRepo>()));
  sl.registerFactory(() => SignInProvider(dioService: sl<DioService>(), auth: sl<AuthRepo>()));




}