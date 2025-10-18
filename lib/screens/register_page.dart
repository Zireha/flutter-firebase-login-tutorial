import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_tutorial/components/my_button.dart';
import 'package:firebase_auth_tutorial/components/my_textfield.dart';
import 'package:firebase_auth_tutorial/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign the user in
  void signUp() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try registering the user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        errorSnackbar("Passwords don't match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // errorSnackbar(e.code);
      if (e.code == "invalid-credential") {
        emailController.clear();
        passwordController.clear();
        errorSnackbar("Email or Password is invalid");
      } else if (e.code == "weak-password") {
        errorSnackbar("Password should be atleast 6 characters");
      }
    }
  }

  void errorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 96,
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
                  "Let\'s make an account for you!",
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
                  height: 12,
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
                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isObscured: true,
                ),
                SizedBox(
                  height: 32,
                ),
                //sign in button
                MyButton(
                  onTap: signUp,
                  buttonName: "Sign Up",
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
                ),
                //Dont have acc? try register one
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.montserrat(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Now",
                        style: GoogleFonts.montserrat(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
