import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fmanager/core/constants/system_constant.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/common/common.dart';
import 'package:get/get.dart' as ls;

class ApiServices {
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
    dio.interceptors.add(interceptorsWrapper);
  }

  BaseOptions baseOptions = BaseOptions(
    baseUrl: SystemConstant.baseUrl,
    contentType: Headers.jsonContentType,
    receiveTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
    persistentConnection: true,
  );

  InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      final String? accessToken = StorageManager.read(StorageKeys.accessToken.toString());
      options.headers = {
        ...options.headers,
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      return handler.next(options);
    },
    onResponse: (Response e, handler) {
      return handler.next(e);
    },
    onError: (DioException e, handler) async {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        CommonDialog.showDefault(
          'Thông báo',
          'Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại',
          () async => await ls.Get.find<AuthLogic>().signOutGoogle(),
        );
      } else if (e.response?.statusCode == HttpStatus.internalServerError) {
        CommonDialog.showDefault(
          'Thông báo',
          'Lỗi hệ thống, vui lòng thử lại sau',
          () => SystemNavigator.pop(),
        );
      }
      return handler.next(e);
    },
  );
}
