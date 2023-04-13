import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Future<FirebaseApp> _initializeFirebase() async {
  //   print("init firebase");
  //   FirebaseApp firebaseApp = await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   return firebaseApp;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CA Flutter Auth'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.cover,
            ),
          ),
          // child: FutureBuilder(
          //   future: _initializeFirebase(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       print("connected");
          //       // return HomeScreen();
          //       return LoginPage();
          //     }
          //     return const Center(child: CircularProgressIndicator());
          //   },
          // ),
          child: LoginPage(),
          // body: LoginPage()
        ));
  }
}
