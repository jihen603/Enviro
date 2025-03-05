import 'package:flutter/material.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/signup/signup.dart'; // Importez votre écran SignUp
import 'package:EnviroSafeIot/src/features/authentification/screens/login_screen.dart'; // Importez votre écran SignIn

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to the Dashboard!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Bouton pour aller à l'écran SignUp
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()), // Navigue vers SignUp
                );
              },
              child: const Text("Go to Sign Up"),
            ),

            const SizedBox(height: 20),

            // Bouton pour aller à l'écran SignIn
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigue vers SignIn
                );
              },
              child: const Text("Go to Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
