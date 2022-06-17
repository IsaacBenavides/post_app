import 'package:flutter/material.dart';

class DarkTheme {
  static ValueNotifier<bool> isDarkTheme = ValueNotifier<bool>(false);

  static changeTheme(bool value) {
    isDarkTheme.value = value;
  }
}
