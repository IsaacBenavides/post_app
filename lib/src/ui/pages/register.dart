import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:post/src/controllers/dark_theme.dart';
import 'package:post/src/controllers/register.dart';
import 'package:post/src/provider.dart';
import 'package:post/src/ui/widgets/loader.dart';
import 'package:post/src/ui/widgets/text_form_field.dart';
import 'package:post/src/utils/responsive.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register(BuildContext context, RegisterController controller) async {
    openLoader(context);
    try {
      await controller.register(
          _emailController.text, _passwordController.text);
      closeLoader(context);
      Navigator.of(context).pop();
    } catch (e) {
      closeLoader(context);
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final RegisterController _registerController = RegisterController()
      ..init(Provider.of(context).authRepository);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(8)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ValueListenableBuilder<bool>(
                valueListenable: DarkTheme.isDarkTheme,
                builder: (context, isDarkMode, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("Register",
                            style: TextStyle(
                                fontSize: responsive.dp(4.5),
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
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
                            onPressed: () =>
                                register(context, _registerController),
                            child: Text(
                              "Register",
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
                              text: "Already have an account? ",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.5),
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.surface)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).pop(),
                              text: "Sign in",
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
