import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authController.firebaseAuthSignOut();
                Get.offNamed("/login");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user?.photoURL ?? "https://picsum.photos/100"), fit: BoxFit.cover)),
            ),
            Text(
                "Selamat datang ${user?.displayName != "" && user?.displayName != null ? user?.displayName : "Anonymous"}"),
            Text("Email kamu :  ${user?.email}"),
            Text("UID kamu : ${user?.uid}"),
            ElevatedButton(
                onPressed: () {
                  print(user);
                },
                child: Text("Test"))
          ],
        ),
      ),
    );
  }
}
