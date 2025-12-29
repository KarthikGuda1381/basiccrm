
import 'package:dio/dio.dart';
import 'package:flutter_basics/TokenStorage.dart';

class AuthInterceptor extends InterceptorsWrapper{

  final Tokenstorage tokenStorage;

  AuthInterceptor({required this.tokenStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStorage.getToken();

    if(token != null && token.isNotEmpty){
      print("The token is $token");
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}