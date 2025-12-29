import 'package:flutter_basics/retrofit/DioClient.dart';
import 'package:flutter_basics/retrofit/api_Service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref){
  return ApiService(ref.read(dioProvider));
});
