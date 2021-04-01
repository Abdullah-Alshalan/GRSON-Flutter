import 'package:firebase_auth/firebase_auth.dart';

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
    } on Exception catch (e) {}
  }

  // SIGN IN
  Future<void> signIn({String email, String password}) async {
    // try {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print('in sign in method');
    return "Signed in";
    // return CHome();
    // } on Exception catch (e) {
    // print("invalid user");
    // return WelcomeScreen();
    // }
    // }
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Stream<User> get user {
  //   // return _firebaseAuth.authStateChanges
  //   //     .map(_userFormFireBaseUser);
  //   return _firebaseAuth.authStateChanges().listen((User user) {
  //     if (user == null) {

  //     } else {
  //       print(user.uid);
  //     }
  //   });
  // }

//   User _userFormFireBaseUser(FirebaseUser user,
//       {String email, String full_name}) {
//     return user != null
//         ? User(uid: user.uid, email: email, full_name: full_name)
//         : null;
//   }
}

// class User {
//   final String uid;
//   final String full_name;
//   final String email;
//   User({this.uid, this.full_name, this.email});
// }
