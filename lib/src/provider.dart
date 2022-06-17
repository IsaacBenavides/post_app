import 'package:flutter/material.dart';
import 'package:post/src/data/repositories/auth_repository.dart';

class Provider extends InheritedWidget {
  const Provider(
      {Key? key, required Widget child, required this.authRepository})
      : super(key: key, child: child);

  final AuthRepository authRepository;

  static Provider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Provider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
