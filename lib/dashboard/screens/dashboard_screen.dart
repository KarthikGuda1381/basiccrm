import 'package:flutter/material.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Center(
        child: Column(
          children: [
            Text("This is a dashboard screen"),

            InkWell(
              onTap: () {
                ref.read(loginProvider.notifier).logout();
                context.go('/login');
              },
              child: Text("Logout")),

            ElevatedButton(onPressed: (){
              context.pushNamed('profile');
            }, child: Text("Go To Profile"))  
          ],
        ),
      ),
    );
  }
  
}