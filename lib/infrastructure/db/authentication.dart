import 'package:caflutterdemo/ui/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../application/interface/spi/iauth_repository.dart';

class Authentication implements IAuthRepository {
  final FirebaseAuth auth;

  Authentication({required this.auth});

  @override
  Future<User?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      print("created user");
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => AuthPage()));
      // await user!.updateProfile(displayName: name);
      // await user.reload();
      // user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  @override
  Future<User?> refreshUser(User user) async {
    // FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
