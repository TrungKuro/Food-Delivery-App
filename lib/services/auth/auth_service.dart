import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  /// GET INSTANCE OF FIREBASE AUTH
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// GET CURRENT USER
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// SIGN IN
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    // Try sign user in
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }
    // Catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // SIGN UP
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    // Try sign user up
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }
    // Catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
