import 'package:dio/dio.dart';

class Constants {
  static String handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return "Please check your internet connection";
    }

    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      var error = e.response!.data["message"] ?? 'Validation error';
      if (statusCode == 401) return "Session expired. Please login again.";
      if (statusCode == 404) return "Server not found (404)";
      if (statusCode == 500) return "Server error. Try again later.";
      if (statusCode == 422) return error;

      // Any other error with message from backend
      return e.response?.data["error"] ?? "Something went wrong";
    }

    // Unknown error
    return "Something went wrong";
  }
}