import 'package:post/src/controllers/base.dart';
import 'package:post/src/data/repositories/auth_repository.dart';

class LoginController implements Controller<AuthRepository> {
  late AuthRepository _repository;

  @override
  void init(AuthRepository repository) {
    _repository = repository;
  }

  login(String email, String password) async {
    try {
      await _repository.login(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
