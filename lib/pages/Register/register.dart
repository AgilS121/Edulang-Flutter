// ignore_for_file: sort_child_properties_last
import 'package:edulang/controllers/RegisterController.dart';
import 'package:edulang/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -80), // Sesuaikan dengan kebutuhan
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors
                          .white, // Ganti warna latar belakang sesuai kebutuhan
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          75), // Setengah dari lebar gambar bundar
                      child: Image.asset(
                        "assets/images/default.png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              "JOIN WITH US !",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: MyColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: 20), // Spacer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFieldWithIcon(
                  hintText: 'Username',
                  icon: Icons.person,
                  controller: controller.name,
                  validationController: controller.validationController,
                ),
                const SizedBox(height: 20), // Spacer
                TextFieldWithIcon(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: controller.email,
                  validationController: controller.validationController,
                ),
                const SizedBox(height: 20), // Spacer
                TextFieldWithIcon(
                  hintText: 'Create Password',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: controller.passwordController,
                  validationController: controller.validationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWithIcon(
                  hintText: 'Repeat Password',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: controller.confirm_password,
                  validationController: controller.validationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: MyColors.secondary),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: MyColors.accent,
                            borderRadius: BorderRadius.circular(45)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColors.accent,
                                border: Border.all(
                                  color: Colors.black, // Warna garis tepi hitam
                                  width: 2.0, // Lebar garis tepi
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: Column(
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: MyColors.secondary),
                ),
                GestureDetector(
                  onTap: () {
                    // Tambahkan logika untuk aksi "Sign up" di sini
                    Get.toNamed('/login');
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyColors.secondary,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldWithIcon extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final ValidationRegisterController validationController;

  const TextFieldWithIcon({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    required this.validationController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        // Validasi email
        if (hintText.toLowerCase() == 'email') {
          if (!GetUtils.isEmail(value)) {
            validationController.setEmailError(true);
          } else {
            validationController.setEmailError(false);
          }
        }

        // Validasi password
        if (hintText.toLowerCase() == 'password') {
          if (value.length < 8) {
            validationController.setPasswordError(true);
          } else {
            validationController.setPasswordError(false);
          }
        }

        if (hintText.toLowerCase() == 'confirm_password') {
          validationController.setConfirmPasswordError(
              validationController.passwordController.text, value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.7)), // Warna hint
        fillColor: MyColors.primary,
        filled: true,
        prefixIcon: Icon(icon, color: Colors.white), // Warna ikon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none, // Hilangkan garis tepi
        ),
        suffixIcon: validationController.hasError(hintText.toLowerCase())
            ? Icon(Icons.error, color: Colors.red)
            : null,
        errorText: validationController.hasError(hintText.toLowerCase())
            ? hintText.toLowerCase() == 'email'
                ? validationController.emailErrorMessage.value
                : hintText.toLowerCase() == 'password'
                    ? validationController.passwordErrorMessage.value
                    : validationController.confirmPasswordErrorMessage.value
            : null,
      ),
    );
  }
}
