
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:EnviroSafeIot/src/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../controllers/Signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup'; // Définition du nom de la route

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Initialiser le contrôleur SignUpController avec GetX
  final SignUpController _signUpController = Get.put(SignUpController());

  void _showMessage(String message, Color backgroundColor, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond
          Image.asset(
            tSplashTopImage,
            fit: BoxFit.cover,
          ),

          // Effet de flou
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),

          // Contenu principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Create Account!",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Sign up to get started",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Champ Full Name
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: "Full Name",
                          prefixIcon: const Icon(Icons.person, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Champ Email avec validation
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.email, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Champ Phone Number avec validation
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: "Phone Number",
                          prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number cannot be empty';
                          } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Champ Password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Champ Confirm Password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Bouton Sign Up
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Appeler la méthode registerUser du contrôleur
                            _signUpController.registerUser(
                              emailController.text,
                              "password123", // Ajoutez votre logique pour gérer le mot de passe
                            );
                            // Simuler une logique d'inscription réussie
                            _showMessage(
                              "Your account has been successfully created!",
                              Colors.green,
                              Icons.check_circle,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 18)),
                      ),

                      const SizedBox(height: 20),

                      // Lien "Already have an account? Sign In"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?", style: TextStyle(color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login'); // Utilisation du nom de la route
                            },
                            child: const Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
