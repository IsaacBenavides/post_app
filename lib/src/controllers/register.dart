import 'package:post/src/controllers/base.dart';
import 'package:post/src/data/repositories/auth_repository.dart';

class RegisterController implements Controller<AuthRepository> {
  late AuthRepository _repository;
  @override
  void init(AuthRepository repository) {
    _repository = repository;
  }

  Future<void> register(String email, String password) async {
    await _repository.register(email, password);
  }
}
