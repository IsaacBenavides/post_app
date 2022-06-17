import 'package:firebase_auth/firebase_auth.dart';
import 'package:post/src/utils/session.dart';

class AuthRepository {
  Future<void> login(String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Session.instance.init(credential.user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
