import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:EnviroSafeIot/src/constants/image_strings.dart';
import 'package:EnviroSafeIot/src/constants/sizes.dart';
import 'package:EnviroSafeIot/src/constants/text_strings.dart';
import 'package:EnviroSafeIot/src/features/authentification/form_header_widget.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundd.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Effet de flou
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: tDefaultSize * 4),
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: '',  // Set to blank (white text will be applied in the FormHeaderWidget)
                  subTitle: '',  // Set to blank (white text will be applied in the FormHeaderWidget)
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                ),
                const SizedBox(height: 30),
                const Icon(Icons.phone, size: 60, color: Colors.white),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Enter your phone number",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.phone_outlined, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                    ),
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number cannot be empty';
                      } else if (!RegExp(r'^\+?[0-9]{10,15}\$').hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Ajouter la logique ici
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Changed to black
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
