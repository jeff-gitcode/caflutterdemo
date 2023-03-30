import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

abstract class IAuthRepository {
  Future<User?> signIn({required String email, required String password});
  Future<User?> register(
      {required String name, required String email, required String password});
  Future<User?> refreshUser(User user);
}
