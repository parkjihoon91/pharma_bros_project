import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/log.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();

  dio.interceptors.add(CustomInterceptor(
    ref: ref,
  ));
  return dio;
});

class CustomInterceptor extends Interceptor {
  final Ref? ref;
  final log = Log();

  CustomInterceptor({
    this.ref,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log.logger.d(
      'onRequest: ${options.method}, ${options.uri}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.logger.d(
      'onResponse: ${response.requestOptions.method}, ${response.requestOptions.uri}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.logger.d(
      'onError: ${err.requestOptions.method}, ${err.requestOptions.uri}',
    );
    super.onError(err, handler);
  }
}
