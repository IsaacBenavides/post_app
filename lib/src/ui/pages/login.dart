import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:post/src/controllers/dark_theme.dart';
import 'package:post/src/controllers/login.dart';
import 'package:post/src/provider.dart';
import 'package:post/src/ui/routes/names.dart';
import 'package:post/src/ui/widgets/loader.dart';
import 'package:post/src/ui/widgets/text_form_field.dart';
import 'package:post/src/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context, LoginController controller) async {
    openLoader(context);
    try {
      await controller.login(_emailController.text, _passwordController.text);
      closeLoader(context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutesNames.home, (route) => false);
    } catch (e) {
      closeLoader(context);
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final LoginController _loginController = LoginController()
      ..init(Provider.of(context).authRepository);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(8)),
          child: LayoutBuilder(builder: (context, constraints) {
            double _maxWidth = constraints.maxWidth;
            return ValueListenableBuilder<bool>(
                valueListenable: DarkTheme.isDarkTheme,
                builder: (context, isDarkMode, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: responsive.dp(4.5),
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      SizedBox(height: responsive.hp(6)),
                      const AuthWithSocialMediaContainer(),
                      SizedBox(height: responsive.hp(6)),
                      _OrContainer(maxWidth: _maxWidth),
                      SizedBox(height: responsive.hp(6)),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      SizedBox(height: responsive.hp(2)),
                      TextFormFieldWidget(
                        borderColor: isDarkMode
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.surface,
                        maxLines: 1,
                        controller: _emailController,
                      ),
                      SizedBox(height: responsive.hp(2)),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      SizedBox(height: responsive.hp(2)),
                      TextFormFieldWidget(
                        borderColor: isDarkMode
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.surface,
                        maxLines: 1,
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      SizedBox(height: responsive.hp(8)),
                      SizedBox(
                        width: responsive.wp(100),
                        height: responsive.hp(6),
                        child: ElevatedButton(
                            onPressed: () => login(context, _loginController),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: responsive.dp(1.8),
                              ),
                            )),
                      ),
                      SizedBox(height: responsive.hp(5)),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.5),
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.surface)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed(RoutesNames.register),
                              text: "Sign up",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.5),
                                  color: Colors.blue))
                        ])),
                      )
                    ],
                  );
                });
          }),
        )),
      ),
    );
  }
}

class AuthWithSocialMediaContainer extends StatelessWidget {
  const AuthWithSocialMediaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return GestureDetector(
      child: Container(
          width: responsive.wp(90),
          height: responsive.hp(6.5),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: responsive.dp(1),
                  spreadRadius: responsive.dp(1),
                )
              ]),
          child: LayoutBuilder(builder: (context, c) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google.png",
                  height: c.maxHeight * 0.6,
                ),
                SizedBox(width: responsive.wp(1)),
                Text("Use Google account",
                    style: TextStyle(
                        fontSize: responsive.dp(1.7),
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.surface)),
              ],
            );
          })),
    );
  }
}

class _OrContainer extends StatelessWidget {
  const _OrContainer({
    Key? key,
    required double maxWidth,
  })  : _maxWidth = maxWidth,
        super(key: key);

  final double _maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          height: 3,
          color: Colors.grey,
        )),
        SizedBox(
          width: _maxWidth * 0.25,
          child: Center(
            child: Text(
              "Or",
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
          ),
        ),
        const Expanded(
            child: Divider(
          height: 3,
          color: Colors.grey,
        )),
      ],
    );
  }
}
