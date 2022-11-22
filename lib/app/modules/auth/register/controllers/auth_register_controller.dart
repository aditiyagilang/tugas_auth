import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthRegisterController extends GetxController {
  //TODO: Implement AuthRegisterController

  final count = 0.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
