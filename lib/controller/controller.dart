import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conformPassController = TextEditingController();

  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> signUpEmailFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> signUpPassFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> signUpConformPassFieldKey =
      GlobalKey<FormFieldState>();

  RxBool _isObscureText = RxBool(true);
  bool get isObscureText => _isObscureText.value;
  setIsObscureText(bool value) {
    _isObscureText.value = value;
  }

  void resetKey() {
    emailFieldKey.currentState?.reset();
    passFieldKey.currentState?.reset();
    signUpConformPassFieldKey.currentState?.reset();
    signUpPassFieldKey.currentState?.reset();
    signUpEmailFieldKey.currentState?.reset();
  }

  RxBool _obscureForConform = RxBool(true);
  bool get isObscureForConform => _obscureForConform.value;
  setIsObscureForConform(bool value) {
    _obscureForConform.value = value;
  }
}
