import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = GetIt.instance<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    print('login page build');
    return Text('login page');
  }
}

class LoginPage1 extends StatefulWidget {
  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
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
            print(state);
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print("login page ");
              return null;
              // return Column(children: [
              //   // Image.asset(
              //   //   '../../../assets/images/smile.jpg',
              //   //   fit: BoxFit.fitWidth,
              //   //   width: 200,
              //   //   height: 200,
              //   //   color: Colors.white,
              //   // ),
              //   Text('Login', style: Theme.of(context).textTheme.headline4),
              //   TextFormField(
              //     controller: emailText,
              //     decoration: InputDecoration(
              //       hintText: 'Email',
              //       prefixIcon: Icon(Icons.email, color: Colors.blue),
              //     ),
              //   ),
              //   TextFormField(
              //     controller: passwordText,
              //     decoration: InputDecoration(
              //       hintText: 'Password',
              //       prefixIcon: Icon(Icons.lock, color: Colors.blue),
              //     ),
              //   ),
              //   Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Expanded(
              //             child: ElevatedButton(
              //                 onPressed: () async {
              //                   print(emailText.text);
              //                   print(passwordText.text);

              //                   // User? user = await Authentication.signIn(
              //                   //     email: emailText.text,
              //                   //     password: passwordText.text,
              //                   //     context: context);

              //                   authCubit.login(
              //                       email: emailText.text,
              //                       password: passwordText.text);

              //                   // print(user);
              //                   // if (user != null) {
              //                   //   Navigator.push(
              //                   //       context,
              //                   //       MaterialPageRoute(
              //                   //           builder: (context) => HomeScreen()));
              //                   // }
              //                 },
              //                 child: Text('Sign In',
              //                     style: TextStyle(color: Colors.white)))),
              //         Expanded(
              //             child: ElevatedButton(
              //                 onPressed: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) => RegisterPage()));

              //                   // Navigator.of(context).push(
              //                   //   MaterialPageRoute(
              //                   //     builder: (context) => RegisterPage(),
              //                   //   ),
              //                   // );
              //                 },
              //                 // onPressed: () async {
              //                 //   await Authentication.register(
              //                 //     name: '',
              //                 //     email: '',
              //                 //     password: '',
              //                 //   );
              //                 // },
              //                 child: Text('Register',
              //                     style: TextStyle(color: Colors.white))))
              //       ])
              // ]);
            }
          },
        )));
  }
}
