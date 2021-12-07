import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseauth = FirebaseAuth.instance;

class AuthenticationService {
  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Sign In';
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<String?> signUp(String email, String password) async {
    
    try {
      await _firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Sign Up';
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseauth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
