import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ));

  static Dio get instance => _dio
    ..interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        if (_shouldRetry(error)) {
          await Future.delayed(const Duration(seconds: 1));
          return handler.resolve(await _dio.request(error.requestOptions.path));
        }
        return handler.next(error);
      },
    ));

  static bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout;
  }
}
