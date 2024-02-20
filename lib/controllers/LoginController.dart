import 'package:edulang/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController {
  var emailError = RxBool(false);
  var passwordError = RxBool(false);

  // Variabel observabel untuk menyimpan pesan kesalahan
  var emailErrorMessage = RxString('');
  var passwordErrorMessage = RxString('');

  bool hasError(String field) {
    if (field.toLowerCase() == 'email') {
      return emailError.value;
    } else if (field.toLowerCase() == 'password') {
      return passwordError.value;
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
}
