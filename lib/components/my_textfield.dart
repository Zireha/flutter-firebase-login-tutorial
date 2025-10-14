import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool isObscured;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isObscured,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: controller,
        obscureText: isObscured,
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade400),
            ),
            fillColor: Colors.amber.shade400,
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(color: Colors.grey[700])),
      ),
    );
  }
}
