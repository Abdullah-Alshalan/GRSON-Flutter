import 'package:firebase_auth/firebase_auth.dart';

class AuthrRepository {
  AuthrRepository._();

  static final AuthrRepository instance = AuthrRepository._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password, String username) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
  // getCurrentUser
}
