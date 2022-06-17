import 'package:flutter/material.dart';
import 'package:post/src/utils/session.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${Session.instance.user?.email}',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
