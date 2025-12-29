import 'package:dio/dio.dart';
import 'package:flutter_basics/login/model/login.dart';
import 'package:flutter_basics/login/request/login_request.dart';

import 'package:retrofit/retrofit.dart';

part 'api_Service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("api/v1/auth")
  Future<Login> login(@Body() LoginRequest loginrequest);  


}