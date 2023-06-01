import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logging_interceptor.dart';

class DioService{
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;
  String? countryCode;


  DioService(this.baseUrl,Dio? dioC,{required this.loggingInterceptor,required this.sharedPreferences,}){
    //dio.options.headers['Content-Type'] = 'application/json';
    //dio = dioC ?? Dio();
    print("der_service constructor..................${dio}");
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(microseconds: 30000)
      ..options.receiveTimeout = Duration(microseconds: 30000)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer $token',
        //AppConstants.LANG_KEY : countryCode == 'US'? 'en':countryCode.toLowerCase(),
      };
    //..options.headers['Content-Type'] = 'application/json';
    dio!.interceptors.add(loggingInterceptor);
  }

  void updateHeader(String token, String countryCode) {
    token = (token == null ? this.token : token)!;
    // countryCode = countryCode == null ? this.countryCode == 'US' ? 'en': this.countryCode.toLowerCase(): countryCode == 'US' ? 'en' : countryCode.toLowerCase();
    this.token = token;
    this.countryCode = countryCode;
    print('===Country code====>$countryCode');
    print('===Token====>$token');
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      // AppConstants.LANG_KEY: countryCode == 'US'? 'en':countryCode.toLowerCase(),
    };
  }


  Future<Response> get(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }


  Future<Response> post(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio =  Dio();
    print("dio_service.......${dio}");
    try {
      print("dio_service uri..........$uri");
      print("dio_service queryParameters..........${queryParameters.toString()}");
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("dio_service response.........}");
      print("dio_service response.........${response.data.toString()}");
      return response;
    } on FormatException catch (_) {
      print("dio_service FormatException.........");
      throw FormatException("Unable to process the data");
    } catch (e) {
      print("dio_service e.........");

      throw e;
    }
  }


  Future<Response> put(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }


  Future<Response> delete(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

}