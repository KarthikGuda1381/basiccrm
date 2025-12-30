
import 'dart:async';

import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/constants/authStatus.dart';
import 'package:flutter_basics/login/model/login.dart';
import 'package:flutter_basics/login/repository/login_repository.dart';
import 'package:flutter_basics/retrofit/DioClient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class LoginNotifierProvider extends StateNotifier<LoginState>{

  final Ref ref;

  LoginNotifierProvider(this.ref) : super(LoginState.initial());

  Future<void> initialize() async {
    try{
      final token = await ref.read(tokenStorageProvider)!.getToken();
      state = token == null ? LoginState.unauthenticated() : LoginState.authenticated();
    }catch(e){
      state = LoginState.unauthenticated();
    }
  }

  // Login
  Future<void> login(String empId, String password) async {
    state = LoginState.authenticating();
    try{
    await ref.read(loginRepoProvider).login(empId, password);
    state = LoginState.authenticated();
    
    }catch(e, st){
      state = LoginState.error(e.toString());
    }

  }

  // Logout
  Future<void> logout() async {
    await ref.read(loginRepoProvider).logout();
    state = LoginState.unauthenticated();
  }

}

// Login Provider
final loginProvider = StateNotifierProvider<LoginNotifierProvider, LoginState>((ref){
  return LoginNotifierProvider(ref);
});
