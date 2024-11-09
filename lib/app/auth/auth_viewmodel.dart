import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? errorMessage;

  // Sign up function
  Future<void> signUp(String email, String password) async {
    setBusy(true);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setBusy(false);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      setBusy(false);
    }
  }

  // Login function
  Future<void> login(String email, String password) async {
    setBusy(true);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setBusy(false);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      setBusy(false);
    }
  }

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
