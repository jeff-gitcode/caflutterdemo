import 'package:caflutterdemo/application/interface/spi/iauth_repository.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/infrastructure/db/user_provider.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/auth_page.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:caflutterdemo/ui/pages/user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../../di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<FirebaseApp> _initializeFirebase() async {
  @override
  Widget build(BuildContext context) {
    DependencyInjection.register();

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
