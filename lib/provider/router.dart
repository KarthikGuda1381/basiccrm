import 'package:flutter_basics/constants/authStatus.dart';
import 'package:flutter_basics/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_basics/login/screens/loginscreen.dart';
import 'package:flutter_basics/profile/screen/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref){
  
  return GoRouter(
    initialLocation: '/login',
    routes: routes,
    redirect: (context, state) {

    final authState = ref.watch(loginProvider);
    final location = state.matchedLocation;

    switch(authState.status){
      
      case AuthStatus.unauthenticated :
      return location == '/login' ? null : '/login';

      case AuthStatus.authenticated :
      return location == '/dashboard' ? null : '/dashboard';

      case AuthStatus.error :
      return location == '/login' ? null : '/login';

      case AuthStatus.authenticating :
      return null;

      case AuthStatus.initializing:
      return null;

    }
    },);
});  


final routes = [
  // GoRoute(path: '/',
  // name: 'launcher',
  // builder: (context, state) => const LauncherScreen(),),

  GoRoute(path: '/login',
  name: 'login',
  builder: (context, state) =>  LoginScreen()),

  GoRoute(path: '/dashboard',
  name: 'dashboard',
  builder: (context, state) => const DashboardScreen(),),

  GoRoute(path: '/profile',
  name: 'profile',
  builder: (context, state) => const ProfileScreen(),)
];
