import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

// SIGN UP
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN IN
  Future<void> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      // Navigator.pushReplacementNamed(context, '/home');
      // return CHome();
    } on Exception catch (e) {
      print("invalid user");
      // return WelcomeScreen();
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
