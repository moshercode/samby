abstract class AppError implements Exception {
  const AppError(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkError extends AppError {
  const NetworkError() : super('No internet connection');
}

class DataError extends AppError {
  const DataError(super.message);
}
