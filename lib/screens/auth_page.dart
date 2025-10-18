import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_tutorial/screens/home_page.dart';
import 'package:firebase_auth_tutorial/screens/login_or_register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in yeah
          if (snapshot.hasData) {
            return HomePage();
          }
          //L user not logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
