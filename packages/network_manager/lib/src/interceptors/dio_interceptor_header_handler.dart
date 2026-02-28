import 'package:dio/dio.dart';

class DioInterceptorHeaderHandler extends Interceptor {
  DioInterceptorHeaderHandler({
    required this.getToken,
    required this.getRefreshToken,
    required this.onLoadingChange,
    required this.getParamsDynamic,
    this.enableApiKey = false,
    this.apiKeyHeaderName = 'X-API-Key',
    this.apiKey,
  });

  final Future<String?> Function() getToken;
  final Future<String?> Function() getRefreshToken;
  final Function(bool) onLoadingChange;
  final Future<Map<String, dynamic>> Function() getParamsDynamic;
  final bool enableApiKey;
  final String apiKeyHeaderName;
  final String? apiKey;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    onLoadingChange(true);

    final tokenAccess = await getToken();
    final dynamicParams = await getParamsDynamic();

    if (tokenAccess != null && tokenAccess.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $tokenAccess';
    }

    // Agregar API_KEY si está habilitado y disponible
    if (enableApiKey && apiKey != null && apiKey!.isNotEmpty) {
      options.headers[apiKeyHeaderName] = apiKey;
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
