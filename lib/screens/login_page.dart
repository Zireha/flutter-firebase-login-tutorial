import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_tutorial/components/my_button.dart';
import 'package:firebase_auth_tutorial/components/my_textfield.dart';
import 'package:firebase_auth_tutorial/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign the user in
  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "invalid-credential") {
        emailController.clear();
        passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Username or Password is Invalid",
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 128,
              ),
              //logo
              Icon(
                Icons.access_alarm_rounded,
                size: 100,
              ),

              SizedBox(
                height: 24,
              ),
              //greeting text
              Text(
                "Welcome! or welcome back perhaps?",
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              //username field
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                isObscured: false,
              ),

              const SizedBox(
                height: 28,
              ),

              //password field
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                isObscured: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //forgor passowrd?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.montserrat(color: Colors.black87),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              //sign in button
              MyButton(
                onTap: signIn,
              ),
              //continue with google account
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or continue with",
                        style: GoogleFonts.montserrat(color: Colors.black54),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/assets/google.png'),
                  SizedBox(
                    width: 12,
                  ),
                  SquareTile(imagePath: 'lib/assets/github.png')
                ],
              )
              //Dont have acc? try register one
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
