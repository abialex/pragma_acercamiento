import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import 'i_network_client.dart';
import 'interceptors/dio_interceptor_error_handler.dart';
import 'interceptors/dio_interceptor_header_handler.dart';
import 'network_error.dart';

class AppDioNetworkClient implements AppNetworkClient {
  late final Dio _dio;
  Dio get dio => _dio;

  AppDioNetworkClient({
    required String baseUrl,
    void Function(bool)? onLoadingChange,
    void Function()? onUnauthorized,
    Future<String?> Function()? getToken,
    Future<String?> Function()? getRefreshToken,
    Future<Map<String, dynamic>> Function()? getParamsDynamic,
    String? xAppCode,
    bool isDebug = false,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 25),
        receiveTimeout: const Duration(seconds: 25),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (xAppCode != null) 'X-App-Code': xAppCode,
        },
      ),
    );

    if (isDebug) {
      final talker = Talker();
      _dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printRequestData: true,
            printResponseData: true,
            printErrorData: true,
            printErrorMessage: true,
          ),
        ),
      );
    }

    _dio.interceptors.addAll([
      DioInterceptorHeaderHandler(
        getToken: getToken ?? () async => null,
        getRefreshToken: getRefreshToken ?? () async => null,
        onLoadingChange: onLoadingChange ?? (isLoading) {},
        getParamsDynamic: getParamsDynamic ?? () async => {},
      ),
      DioInterceptorErrorHandler(
        onUnauthorized: onUnauthorized ?? () {},
        onLoadingChange: onLoadingChange ?? (isLoading) {},
      ),
    ]);
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> post(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> put(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> delete(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<dynamic> patch(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.patch(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    final data = e.response?.data;
    final statusCode = e.response?.statusCode;

    // Intentamos extraer un mensaje amigable del backend si existe
    String? message = e.message;
    if (data is Map && data.containsKey('message')) {
      message = data['message'].toString();
    } else if (data is Map && data.containsKey('error')) {
      message = data['error'].toString();
    }

    if (statusCode == 401) {
      return UnauthorizedException(data: data, message: message);
    }

    if (statusCode != null && statusCode >= 500) {
      return ServerException(data: data, message: message);
    }

    return AppNetworkException(
      data: data,
      statusCode: statusCode,
      message: message,
    );
  }
}
