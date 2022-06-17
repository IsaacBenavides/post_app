import 'package:firebase_auth/firebase_auth.dart';

class Session {
  Session._();

  static final Session instance = Session._();
  User? _user;
  User? get user => _user;

  Future<void> init(User? value) async {
    _user = value;
  }
}
