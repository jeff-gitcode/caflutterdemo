import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/infrastructure/db/user_provider.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'application/interface/api/iuser_usecase.dart';
import 'application/interface/spi/iuser_repository.dart';
import 'application/user_usecase.dart';
import 'infrastructure/db/user_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => UserCubit(userUseCase: sl()));

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => UserProvider(httpClient: sl()));
  sl.registerLazySingleton<IUserRepository>(
      () => UserRepository(userProvider: sl()));

  sl.registerLazySingleton<IUserUseCase>(
      () => UserUseCase(userRepository: sl()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CA Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
