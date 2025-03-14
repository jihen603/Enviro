import 'package:EnviroSafeIot/src/features/authentification/authentification_repository.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //Call this function from design and it will do the rest
  void registerUser(String email, String password) {
    AuthentificationRepository.instance.createUserWithEmailAndPassword(email, password);

  }
}