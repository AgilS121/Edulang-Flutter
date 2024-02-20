import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationRegisterController extends GetxController {
  var emailError = RxBool(false);
  var passwordError = RxBool(false);
  var confirmPasswordError = RxBool(false);

  var emailErrorMessage = RxString('');
  var passwordErrorMessage = RxString('');
  var confirmPasswordErrorMessage = RxString('');

  get passwordController => null;

  bool hasError(String field) {
    if (field.toLowerCase() == 'email') {
      return emailError.value;
    } else if (field.toLowerCase() == 'password') {
      return passwordError.value;
    } else if (field.toLowerCase() == 'confirm_password') {
      return confirmPasswordError.value;
    }
    return false;
  }

  void setEmailError(bool value) {
    emailError.value = value;
    emailErrorMessage.value = value ? 'Email tidak valid' : '';
  }

  void setPasswordError(bool value) {
    passwordError.value = value;
    passwordErrorMessage.value =
        value ? 'Password harus minimal 8 karakter' : '';
  }

  void setConfirmPasswordError(String password, String confirmPassword) {
    confirmPasswordError.value = password != confirmPassword;
    confirmPasswordErrorMessage.value =
        confirmPasswordError.value ? 'Password tidak sesuai' : '';
  }
}

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  ValidationRegisterController validationController =
      ValidationRegisterController();
}
