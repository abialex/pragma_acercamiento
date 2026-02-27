import 'package:dio/dio.dart';

class DioInterceptorErrorHandler extends Interceptor {
  DioInterceptorErrorHandler({
    required this.onUnauthorized,
    required this.onLoadingChange,
  });

  final void Function() onUnauthorized;
  final void Function(bool) onLoadingChange;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    onLoadingChange(false);

    if (err.response?.statusCode == 401) {
      onUnauthorized();
    }

    return handler.reject(err);
  }
}
