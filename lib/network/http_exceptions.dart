class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}

class ServerException implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  String toString() => "ServerException: $message";
}
