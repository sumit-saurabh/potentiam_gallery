import 'package:dio/dio.dart';
import 'package:potentiam_gallery/utils/app_logger.dart';

class CurlInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final qp = options.queryParameters;
      final h = options.headers;
      final d = options.data;

      logger.v('api endpoint: ${options.baseUrl}${options.path}');

      final curl =
          'curl -X ${options.method} \'${options.baseUrl}${options.path}${qp.isNotEmpty ? qp.keys.fold('', (value, key) => '$value${value.isEmpty ? '?' : '&'}$key=${qp[key]}\'') : '\''}${h.keys.fold('', (value, key) => '$value -H \'$key: ${h[key]}\'')}${d != null && d.length != 0 ? ' --data-binary \'$d\'' : ''} --insecure';
      logger.v('server_curl: $curl');
    } catch(e) {
      logger.v('CurlInterceptor error: $e');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.v('CurlInterceptor response: $response');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e('CurlInterceptor error: $err');
    super.onError(err, handler);
  }
}