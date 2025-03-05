import 'package:EnviroSafeIot/src/features/authentification/exception/signup_mail_password_failure.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/dashboard.dart';
import 'package:EnviroSafeIot/src/features/authentification/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  // Instance Firebase Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  Future<void> onReady() async {
    super.onReady();

    // Attendre 6 secondes avant de vérifier l'utilisateur
    await Future.delayed(const Duration(seconds: 6));

    firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    firebaseUser.bindStream(_firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => DashboardScreen());
  }

  /// 🔹 **Créer un utilisateur avec email et mot de passe**
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      // Vérification après la création du compte
      if (_firebaseAuth.currentUser != null) {
        Get.offAll(() => DashboardScreen());
      } else {
        Get.to(() => const SplashScreen());
      }

    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("Firebase Auth exception: ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  /// 🔹 **Connexion utilisateur avec email et mot de passe**
  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => DashboardScreen()); // 🔥 Ajout de la redirection après connexion
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
      throw e;
    } catch (e) {
      print("Unexpected error: $e");
      throw e;
    }
  }

  /// 🔹 **Déconnexion de l’utilisateur**
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    Get.offAll(() => const SplashScreen()); // 🔥 Redirection après déconnexion
  }
}
