import 'package:dio/dio.dart';
import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/constants/constants.dart';
import 'package:flutter_basics/error/network_failure.dart';
import 'package:flutter_basics/login/model/error.dart';
import 'package:flutter_basics/login/model/login.dart';
import 'package:flutter_basics/login/request/login_request.dart';
import 'package:flutter_basics/provider/apiprovider.dart';
import 'package:flutter_basics/retrofit/api_Service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepository {
  final ApiService apiservice;
  final Tokenstorage storage;

  LoginRepository({required this.apiservice, required this.storage});

  Future<Login> login(String empId, String password) async {
    try{

    final response = await apiservice.login(LoginRequest(empId: empId, password: password));
    await storage.saveToken(response.token);

    return response;
    } on DioException catch(e){
      throw Networkfailure(message: Constants.handleDioError(e));
    }catch(e){

      throw Networkfailure(message: "Something not working ${e}");
      
    }
  }

  Future<void> logout() async {
    await storage.clearToken();
  }
}

final loginRepoProvider = Provider<LoginRepository>((ref){
  return LoginRepository(apiservice: ref.read(apiServiceProvider),
  storage: ref.read(tokenStorageProvider)!);
});