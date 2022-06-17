import 'package:flutter/material.dart';
import 'package:post/src/ui/pages/home.dart';
import 'package:post/src/ui/pages/login.dart';
import 'package:post/src/ui/pages/register.dart';
import 'package:post/src/ui/pages/splash_page.dart';
import 'package:post/src/ui/routes/names.dart';

class CustomRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);
      case RoutesNames.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutesNames.register:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
