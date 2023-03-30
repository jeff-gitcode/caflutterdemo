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

import 'application/auth_usecase.dart';
import 'application/interface/api/iauth_usecase.dart';
import 'application/interface/api/iuser_usecase.dart';
import 'application/interface/spi/iuser_repository.dart';
import 'application/user_usecase.dart';
import 'infrastructure/db/authentication.dart';
import 'infrastructure/db/user_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => UserCubit(userUseCase: sl()));

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => UserProvider(httpClient: sl()));

  sl.registerLazySingleton<IAuthRepository>(() => Authentication());
  // () => Authentication(auth: FirebaseAuth.instance));
  sl.registerLazySingleton<IUserRepository>(
      () => UserRepository(userProvider: sl()));

  sl.registerLazySingleton<IAuthUseCase>(
      () => AuthUseCase(authRepository: sl()));
  sl.registerLazySingleton<IUserUseCase>(
      () => UserUseCase(userRepository: sl()));

  sl.registerLazySingleton(() => AuthCubit(authUseCase: sl()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await Firebase.initializeApp();
  print("init main");
  await init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CA Flutter Demo',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //     home: const HomeScreen());
        home: AuthPage());
  }
}
