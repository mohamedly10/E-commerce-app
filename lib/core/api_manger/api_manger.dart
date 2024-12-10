import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:flutter/cupertino.dart';

class ApiManger {
  final Dio _dio = Dio();
  Dio get dio => _dio;
  static ApiManger? _instance;

  factory ApiManger() {
    _instance ??= ApiManger._();
    return _instance!;
  }
  ApiManger._() {
    _dio.options.connectTimeout= const Duration(microseconds: 30000);
    _dio.options.baseUrl=ConstantApp.domin;
   // tokenDio.options.connectTimeout= const Duration(microseconds: 30000);
   // tokenDio.options.baseUrl=ConstantApp.domin;
   initial_interseptor();
  }

  initial_interseptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint("base url ${options.baseUrl}");
          debugPrint("header ${options.headers}");
          debugPrint("quary parameters ${options.queryParameters}");
          debugPrint("data ${options.data}");
          debugPrint("path${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint("state code  ${response.statusCode}");
          debugPrint("data${response.data}");
          log(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          debugPrint("state code  ${error.response!.statusCode}");
          debugPrint("path ${error.requestOptions.path}");
          debugPrint("response ${error.response}");
          debugPrint("error ${error.error}");
          debugPrint("message${error.message}");
          debugPrint("type${error.type}");
          return handler.next(error);
        },
      ),
    );
  }
}





// class ApiManger {
//   static ApiManger? _instance;
//
//   factory ApiManger() {
//     _instance ??= ApiManger._();
//     return _instance!;
//   }
//
//   Dio freeDio = Dio();
//   Dio tokenDio = Dio();
//
//   ApiManger._() {
//    freeDio.options.connectTimeout= const Duration(microseconds: 30000);
//    freeDio.options.baseUrl=ConstantApp.domin;
//    tokenDio.options.connectTimeout= const Duration(microseconds: 30000);
//    tokenDio.options.baseUrl=ConstantApp.domin;
//    initial_interseptor();
//   }
//
//   initial_interseptor(){
// freeDio.interceptors.clear();
// tokenDio.interceptors.clear();
//    freeDio.interceptors.add(
//     InterceptorsWrapper(
//      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//    debugPrint("base url ${options.baseUrl}");
//    debugPrint("header ${options.headers}");
//    debugPrint("quary parameters ${options.queryParameters}");
//    debugPrint("data ${options.data}");
//    debugPrint("path${options.path}");
//       // Do something before request is sent.
//       // If you want to resolve the request with custom data,
//       // you can resolve a `Response` using `handler.resolve(response)`.
//       // If you want to reject the request with a error message,
//       // you can reject with a `DioException` using `handler.reject(dioError)`.
//       return handler.next(options);
//      },
//      onResponse: (Response response, ResponseInterceptorHandler handler) {
//        debugPrint("state code  ${response.statusCode}");
//        debugPrint("data${response.data}");
//        log(response.data.toString());
//
//       return handler.next(response);
//      },
//      onError: (DioException error, ErrorInterceptorHandler handler) {
//        debugPrint("state code  ${error.response!.statusCode}");
//        debugPrint("path ${error.requestOptions.path}");
//        debugPrint("response ${error.response}");
//        debugPrint("error ${error.error}");
//        debugPrint("message${error.message}");
//        debugPrint("type${error.type}");
//
//       return handler.next(error);
//      },
//     ),
//    );
//   }
//




//  Future<Response> call_SignUp_Api(String endPoint, body){
//   print('from api manger');
//    print(dio.post(ConstantApp.base_url+endPoint,
//        data: body));
//   return dio.post(ConstantApp.base_url+endPoint,
//   data: body);
// }
