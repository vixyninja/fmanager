import 'package:dio/dio.dart';
import 'package:fmanager/core/constants/system_constant.dart';
import 'package:get/get.dart';

class ApiServices extends GetxController {
  final Dio dio = Dio();

  ApiServices() {
    dio.options = baseOptions;
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      error: true,
      requestHeader: false,
      request: false,
      responseHeader: false,
    ));
  }

  BaseOptions baseOptions = BaseOptions(
    baseUrl: SystemConstant.baseUrl,
    contentType: Headers.jsonContentType,
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json,
    persistentConnection: true,
  );
}
