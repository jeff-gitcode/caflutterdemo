import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    print("init firebase");
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CA Flutter Demo'),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("connected");
            // return HomeScreen();
            return LoginPage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // body: LoginPage()
    );
  }
}
