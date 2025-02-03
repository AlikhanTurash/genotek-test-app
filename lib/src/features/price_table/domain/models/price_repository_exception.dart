class PriceRepositoryException implements Exception {
  final String message;
  final dynamic error;

  PriceRepositoryException(this.message, [this.error]);

  @override
  String toString() =>
      'PriceRepositoryException: $message${error != null ? ' ($error)' : ''}';
}
