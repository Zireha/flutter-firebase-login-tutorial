import 'package:firebase_auth_tutorial/components/my_button.dart';
import 'package:firebase_auth_tutorial/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                controller: usernameController,
                hintText: "Username",
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
              SizedBox(height: 12,),
              //sign in button
              MyButton(),
              //continue with google account

              //Dont have acc? try register one
            ],
          ),
        ),
      ),
    );
  }
}
