import 'package:EnviroSafeIot/firebase_options.dart';
import 'package:EnviroSafeIot/src/features/authentification/authentification_repository.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/login_screen.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/signup/signup.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/splash_screen/splash_screen.dart';
import 'package:EnviroSafeIot/src/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';// Importez l'écran du Dashboard

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthentificationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/splash', // Définit l'écran de démarrage
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(), // Utilisation du nom de la route
        '/dashboard': (context) => DashboardScreen(), // Route pour le Dashboard
      },
    );
  }
}
