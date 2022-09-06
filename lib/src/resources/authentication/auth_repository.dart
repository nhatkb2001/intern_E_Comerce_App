import 'package:e_comerce_intern_nhat/src/ui/authentication/screens/loginScreen.dart';
import 'package:e_comerce_intern_nhat/src/ui/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  //Sign Up with emaill and password
  Future<void> signUp(
      {required String email, required String password, context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => signIn(
                email: email,
                password: password,
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn(
      {required String email, required String password, context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const atDashboardScreen())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut(context) async {
    try {
      await _firebaseAuth.signOut().whenComplete(() => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const atLoginScreen())));
    } catch (e) {
      throw Exception(e);
    }
  }
}
