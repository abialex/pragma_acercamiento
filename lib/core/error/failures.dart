/// Clase base para manejo de errores en todo el ecosistema
abstract class FailureApp {
  final String error;
  final List<String>? errorList;
  final String? titulo;
  final int? statusCode;

  const FailureApp({required this.error, this.titulo, this.statusCode, this.errorList});
}

class FailureLocal extends FailureApp {
  const FailureLocal({required super.error});
}

class FailureApi extends FailureApp {
  const FailureApi({super.titulo, required super.error, required super.statusCode, super.errorList});
}
