import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget{

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: Column(
        children: [
          Text("This is a profile screen")
        ],
      ),
    );
  }
  
}