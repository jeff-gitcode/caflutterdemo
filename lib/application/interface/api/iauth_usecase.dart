import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthUseCase {
  Future<User?> login(String email, String password);
  Future<User?> register(String name, String email, String password);
}
