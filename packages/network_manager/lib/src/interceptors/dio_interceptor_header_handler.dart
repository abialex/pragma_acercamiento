import 'package:dio/dio.dart';

class DioInterceptorHeaderHandler extends Interceptor {
  DioInterceptorHeaderHandler({
    required this.getToken,
    required this.getRefreshToken,
    required this.onLoadingChange,
    required this.getParamsDynamic,
  });

  final Future<String?> Function() getToken;
  final Future<String?> Function() getRefreshToken;
  final Function(bool) onLoadingChange;
  final Future<Map<String, dynamic>> Function() getParamsDynamic;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    onLoadingChange(true);

    final tokenAccess = await getToken();
    final dynamicParams = await getParamsDynamic();

    if (tokenAccess != null && tokenAccess.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $tokenAccess';
    }

    options.headers['Content-Type'] = 'application/json';
    options.queryParameters.addAll(dynamicParams);

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    onLoadingChange(false);
    super.onResponse(response, handler);
  }
}
