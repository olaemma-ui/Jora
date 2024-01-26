import 'dart:developer';

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('/profile')) {}

    log('URI [${options.uri.path}]');
    log('URI [${options.uri.queryParameters}]');
    handler.next(options);
  }
}
