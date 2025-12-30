import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Tokenstorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _tokenKey = "AuthToken"; 

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}

final tokenStorageProvider = Provider<Tokenstorage>((ref){
  return Tokenstorage();
});

final tokenProvider = FutureProvider<String?>((ref)async{
  final storage = Tokenstorage();
  return await storage.getToken();
});