import 'package:dio/dio.dart';

class ApiResponseModel {
   Response? response;
   dynamic error;

  ApiResponseModel(this.response, this.error);

  ApiResponseModel.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponseModel.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;

  //equivalent the above code
  // ApiResponseModel.withSuccess(Response responseValue){
  //   response = responseValue;
  //   error = null;
  // }

}
