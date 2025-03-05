import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:EnviroSafeIot/src/constants/sizes.dart';
import 'package:EnviroSafeIot/src/constants/text_strings.dart';
import 'dart:ui'; // Import for BackdropFilter

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient and blur effect
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4A90E2), Color(0xFFFF6A00), Color(0xFF000000), Color(0xFFFFFFFF)], // Gradient with blue, orange, black, and white
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Added a semi-transparent overlay for the blur effect
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tOtpTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(
                  tOtpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                Text(
                  "$tOtpMessage at your E-Mail",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20.0),

                // OTP Input Field
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.white.withOpacity(0.2),
                  filled: true,
                  textStyle: const TextStyle(color: Colors.white),
                  onSubmit: (code) {
                    print("OTP is => $code");
                  },
                ),

                const SizedBox(height: 20.0),

                // "Next" Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.3),
                    ),
                    child: const Text("Next", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
