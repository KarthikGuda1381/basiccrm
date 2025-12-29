import 'package:flutter/material.dart';
import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LauncherScreen extends ConsumerStatefulWidget{
  const LauncherScreen({super.key});

  @override
  ConsumerState<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends ConsumerState<LauncherScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(loginProvider.notifier).initialize();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Launcher Screen'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            ref.read(tokenStorageProvider)!.clearToken();
          },
          child: Text('This is a launcher screen')),
      ),
    );
  }
}
