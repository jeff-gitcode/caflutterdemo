import 'package:caflutterdemo/application/auth_usecase.dart';
import 'package:caflutterdemo/application/interface/api/iauth_usecase.dart';
import 'package:caflutterdemo/application/interface/api/iuser_usecase.dart';
import 'package:caflutterdemo/application/interface/spi/iauth_repository.dart';
import 'package:caflutterdemo/application/interface/spi/iuser_repository.dart';
import 'package:caflutterdemo/application/user_usecase.dart';
import 'package:caflutterdemo/infrastructure/db/authentication.dart';
import 'package:caflutterdemo/infrastructure/db/user_provider.dart';
import 'package:caflutterdemo/infrastructure/db/user_repository.dart';
import 'package:caflutterdemo/main.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

// T getIt<T>() => GetIt.instance.get<T>();
final getIt = GetIt.instance;

class TestDependencyInjection {
  static register() {
    // Register all your dependencies here
    GetIt.instance.registerLazySingleton(() => UserCubit(userUseCase: getIt()));

    GetIt.instance.registerLazySingleton(() => Client());
    GetIt.instance
        .registerLazySingleton(() => UserProvider(httpClient: getIt()));

    GetIt.instance.registerLazySingleton<IAuthRepository>(
        () => Authentication(auth: FirebaseAuth.instance));
    GetIt.instance.registerLazySingleton<IUserRepository>(
        () => UserRepository(userProvider: getIt()));

    GetIt.instance.registerLazySingleton<IAuthUseCase>(
        () => AuthUseCase(authRepository: getIt()));
    GetIt.instance.registerLazySingleton<IUserUseCase>(
        () => UserUseCase(userRepository: getIt()));

    GetIt.instance.registerLazySingleton(() => AuthCubit(authUseCase: getIt()));
  }
}
