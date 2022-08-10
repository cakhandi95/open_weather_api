class ServerException implements Exception {
  final String httpStatus;
  final String message;

  ServerException(this.message, this.httpStatus);

}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
