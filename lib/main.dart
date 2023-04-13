import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'di.dart';
import 'firebase_options.dart';
// final sl = GetIt.instance;

// Future<void> init() async {
//   sl.registerLazySingleton(() => UserCubit(userUseCase: sl()));

//   sl.registerLazySingleton(() => Client());
//   sl.registerLazySingleton(() => UserProvider(httpClient: sl()));

//   sl.registerLazySingleton<IAuthRepository>(
//       () => Authentication(auth: FirebaseAuth.instance));
//   sl.registerLazySingleton<IUserRepository>(
//       () => UserRepository(userProvider: sl()));

//   sl.registerLazySingleton<IAuthUseCase>(
//       () => AuthUseCase(authRepository: sl()));
//   sl.registerLazySingleton<IUserUseCase>(
//       () => UserUseCase(userRepository: sl()));

//   sl.registerLazySingleton(() => AuthCubit(authUseCase: sl()));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DependencyInjection.register();

  print("init main");
  // await init();

  runApp(const MyApp());
}
