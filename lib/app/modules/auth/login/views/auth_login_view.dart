import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:learn_flutter/app/modules/auth/controllers/auth_controller.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  AuthLoginView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Silahkan login untuk melanjutkan",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        authController.firebaseAuthLogin(
                            controller.emailController.text,
                            controller.passwordController.text);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(child: Text("Atau")),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        authController.signInWithGoogle();

                      },
                      icon: FaIcon(FontAwesomeIcons.google),
                      label: Text(
                        "Masuk Dengan Google",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.AUTH_REGISTER);
                      },
                      child: Text("Daftar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
