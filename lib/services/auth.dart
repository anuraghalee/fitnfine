import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final dUser = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInAnon() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}
