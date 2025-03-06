import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// import '../lib.dart';
// import 'api_setup.dart';

class AppDio {
  bool isDebug = false;
  AppDio();
  Dio initial() {
    final dio = Dio();
    // final dio = Dio(DioBaseOptions().opts)..interceptors.add(DioInterceptor());
    // dio.httpClientAdapter = NativeAdapter();
    return dio;
  }

  Dio initialIAppService() {
    final dio = Dio();
    // dio.httpClientAdapter = NativeAdapter();
    return dio;
  }
}

class DioBaseOptions {
  final BaseOptions opts = BaseOptions(
    responseType: ResponseType.json,
    // connectTimeout: const Duration(seconds: 10),
    // receiveTimeout: const Duration(seconds: 10),
  );
}

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
    debugPrint('\n');
    debugPrint(
        '<--- HTTP CODE : ${response.statusCode} URL : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    debugPrint('Response: ${response.data}');
    // debugPrint('Headers: ${response.headers}');
    debugPrint('<--- END HTTP');
  }
}
