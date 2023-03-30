import 'package:caflutterdemo/application/interface/api/iauth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'interface/spi/iauth_repository.dart';

class AuthUseCase implements IAuthUseCase {
  final IAuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  @override
  Future<User?> login(String email, String password) async {
    return await authRepository.signIn(email: email, password: password);
  }

  @override
  Future<User?> register(String name, String email, String password) async {
    return await authRepository.register(
        name: name, email: email, password: password);
  }
}
