import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'auth_page.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      // return BlocProvider<AuthCubit>(
      // create: (context) => authCubit,
      // child: BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      // child: BlocBuilder<AuthCubit, AuthState>(
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

                                    // if (state.user != null) {
                                    //   print("user is not null");
                                    //   print(state.user);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                    // }
                                  },
                                  child: const Text('Register',
                                      style: TextStyle(color: Colors.white))))
                        ])
                  ],
                ),
              ));
        }
      },
    );
  }
}
