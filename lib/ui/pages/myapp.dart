import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<FirebaseApp> _initializeFirebase() async {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => GetIt.instance<AuthCubit>(),
          ),
          BlocProvider<UserCubit>(
            create: (context) => GetIt.instance<UserCubit>(),
          ),
        ],
        child: MaterialApp(
            title: 'CA Flutter Demo',
            // debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //     home: const HomeScreen());
            home: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: AuthPage())));
  }
}
