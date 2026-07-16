import 'package:dio/dio.dart';
import 'package:post_explorer/core/error/failure.dart';

class FailureMapper {
  static Failure fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkFailure('Connection timed out. Please try again.');

      case DioExceptionType.connectionError:
        return const NetworkFailure('No internet connection.');

      // here i can  map bad response to specific status codes but for simple json fetching this is enough
      case DioExceptionType.badResponse:
        return const ServerFailure('Server error. try again later.');

      default:
        return const UnknownFailure('Something went wrong.');
    }
  }
}
