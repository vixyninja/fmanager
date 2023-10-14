import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  ApiServices() {
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(interceptorsWrapper);
  }

  InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
    onError: (e, handler) {
      print(e.message);
      return handler.next(e);
    },
    onRequest: (options, handler) {
      print('${options.method} | ${options.path}');
      return handler.next(options);
    },
    onResponse: (e, handler) {
      print(e.data);
      return handler.next(e);
    },
  );
}
