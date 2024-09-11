import 'package:dio/dio.dart';
import 'package:learning_system/cache/Mycache.dart';
import 'package:learning_system/core/api/endpoints.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.receiveTimeout = const Duration(seconds: 60);
    options.headers['Authorization'] =
        MyCache().getData(key: ApiKeys.token) != null
            ? 'bearer ${MyCache().getData(key: ApiKeys.token)}'
            : null;

    super.onRequest(options, handler);
  }
}
