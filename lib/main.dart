import 'package:flutter/material.dart';
import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/constants/authStatus.dart';
import 'package:flutter_basics/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_basics/launcher_screen.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_basics/login/screens/loginscreen.dart';
import 'package:flutter_basics/profile/screen/profile_screen.dart';
import 'package:flutter_basics/provider/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
  ProviderScope(
  child:
    MyApp()
  )
  );
}

class MyApp extends ConsumerWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authState = ref.watch(loginProvider);

    if(authState.status == AuthStatus.initializing){
      return const MaterialApp(
        home: LauncherScreen(),
      );
    }

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider) ,
    );
  }
}



