import 'package:dio/dio.dart';
import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/retrofit/AuthInterceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Token Storage Provider
final tokenStorageProvider = Provider<Tokenstorage>((ref){
  return Tokenstorage();
});


// Dio Provider
final dioProvider = Provider<Dio>((ref){

  final tokenStorage = ref.read(tokenStorageProvider);

  var dio = Dio(BaseOptions(
    baseUrl: '',
    headers: {
      'Accept': 'application/json',
    },
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15)
  ));

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  dio.interceptors.add(AuthInterceptor(tokenStorage: tokenStorage));

  return dio;

});
