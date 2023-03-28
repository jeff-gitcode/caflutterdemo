import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/db/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailText = TextEditingController();

  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Login', style: Theme.of(context).textTheme.headline4),
            TextFormField(
              controller: emailText,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
              ),
            ),
            TextFormField(
              controller: passwordText,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        print(emailText.text);
                        print(passwordText.text);

                        User? user = await Authentication.signIn(
                            email: emailText.text,
                            password: passwordText.text,
                            context: context);

                        print(user);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text('Sign In',
                          style: TextStyle(color: Colors.white)))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => RegisterPage(),
                        //   ),
                        // );
                      },
                      // onPressed: () async {
                      //   await Authentication.register(
                      //     name: '',
                      //     email: '',
                      //     password: '',
                      //   );
                      // },
                      child: Text('Register',
                          style: TextStyle(color: Colors.white))))
            ])
          ],
        ));
  }
}
