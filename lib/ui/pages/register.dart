import 'package:caflutterdemo/ui/pages/auth_page.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/db/authentication.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Register', style: Theme.of(context).textTheme.headline4),
              TextFormField(
                controller: nameText,
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: emailText,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail, color: Colors.blue),
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
                          final user = await Authentication.register(
                            name: nameText.text,
                            email: emailText.text,
                            password: passwordText.text,
                            context: context,
                          );

                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthPage()));
                          }
                        },
                        child: Text('Register',
                            style: TextStyle(color: Colors.white))))
              ])
            ],
          ),
        ));
  }
}
