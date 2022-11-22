import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() => firebaseAuth.authStateChanges();

  GoogleSignIn _googleSignIn = GoogleSignIn(
  );

  void firebaseAuthLogin(String emailAddress, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      Get.offNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await firebaseAuth.signInWithCredential(credential);
    Get.offNamed("/home");
    return userCredential;
  }

  void firebaseAuthSignUp(String emailAddress, String password, String displayName) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      User? user = credential.user;

      await user?.updateDisplayName(displayName);

      Get.offNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void firebaseAuthSignOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}
