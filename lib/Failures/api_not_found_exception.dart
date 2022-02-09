class ApiNotFoundException implements Exception {
  final String message;
  ApiNotFoundException(this.message);
}
