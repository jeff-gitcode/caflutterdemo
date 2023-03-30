import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  late final AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = GetIt.instance<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => authCubit,
        child: BlocListener<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        }, child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Register'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Register',
                            style: Theme.of(context).textTheme.headline4),
                        TextFormField(
                          controller: nameText,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person, color: Colors.blue),
                          ),
                        ),
                        TextFormField(
                          controller: emailText,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail, color: Colors.blue),
                          ),
                        ),
                        TextFormField(
                          controller: passwordText,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        authCubit.register(
                                            name: nameText.text,
                                            email: emailText.text,
                                            password: passwordText.text);

                                        // if (user != null) {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               AuthPage()));
                                        // }
                                      },
                                      child: const Text('Register',
                                          style:
                                              TextStyle(color: Colors.white))))
                            ])
                      ],
                    ),
                  ));
            }
          },
        )));
  }
}
