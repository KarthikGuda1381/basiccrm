import 'package:flutter/material.dart';
import 'package:flutter_basics/TokenStorage.dart';
import 'package:flutter_basics/constants/authStatus.dart';
import 'package:flutter_basics/login/application/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget{
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() {
    return _LoginState();
  }
  
}

class _LoginState extends ConsumerState<LoginScreen>{

  final formKey = GlobalKey<FormState>();

  late final TextEditingController crnController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    crnController = TextEditingController();
    passwordController = TextEditingController();
    
  }

  @override
  void dispose() {
    super.dispose();
    crnController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loginstate = ref.watch(loginProvider);

    ref.listen(loginProvider, (prev, next){
      if(next.status == AuthStatus.error){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });


    
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Container(
        child: Form(
          child: Column(
            children: [
              // Enter CRN
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter CRN'
                ),
                controller: crnController,
              ),

              SizedBox(height: 10,),

              // Enter Password
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  
                ),
                controller: passwordController,
              ),

              // Progress Bar
              if(loginstate.status == AuthStatus.authenticating)
              Center(child: CircularProgressIndicator(),),

              /**
               * Login Button
               */
              ElevatedButton(
                
                onPressed: loginstate.status == AuthStatus.authenticating ? null : () async {
                // Login Button  
                await ref.read(loginProvider.notifier).login(crnController.text, passwordController.text);

              },
               style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 20, 125, 23)),
               child: loginstate.status == AuthStatus.authenticating ? const CircularProgressIndicator() : 
                Text('Login',style: TextStyle(color: Colors.white),),)

            ],
          )),
      ),
    );
  }

}