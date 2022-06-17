import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:post/firebase_options.dart';
import 'package:post/src/controllers/dark_theme.dart';
import 'package:post/src/data/repositories/auth_repository.dart';
import 'package:post/src/provider.dart';
import 'package:post/src/ui/pages/splash_page.dart';
import 'package:post/src/ui/routes/routes.dart';
import 'package:post/src/ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: DarkTheme.isDarkTheme,
        builder: (context, isDarkTheme, _) {
          final _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
          return Provider(
            authRepository: AuthRepository(),
            child: MaterialApp(
              title: 'Flutter Demo',
              home: const SplashScreen(),
              onGenerateRoute: CustomRoutes.routes,
              debugShowCheckedModeBanner: false,
              darkTheme: CustomTheme.darkTheme(context),
              theme: CustomTheme.ligthTheme(context),
              themeMode: _themeMode,
            ),
          );
        });
  }
}


/// TODO:
/// - mostrar errores al momento de loguearse o registraese
/// - crear pantalla de post
/// - crear pantalla de perfil