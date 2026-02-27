class AppNetworkException implements Exception {
  final dynamic data;
  final int? statusCode;
  final String? message;

  AppNetworkException({this.data, this.statusCode, this.message});

  @override
  String toString() => 'AppNetworkException: $message (Status: $statusCode)';
}

class UnauthorizedException implements AppNetworkException {
  @override
  final dynamic data;
  @override
  final int? statusCode;
  @override
  final String? message;

  UnauthorizedException({this.data, this.message}) : statusCode = 401;

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ServerException implements AppNetworkException {
  @override
  final dynamic data;
  @override
  final int? statusCode;
  @override
  final String? message;

  ServerException({this.data, this.message}) : statusCode = 500;

  @override
  String toString() => 'ServerException: $message';
}
