import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:post/src/ui/widgets/bottom_nav_bar.dart';
import 'package:post/src/utils/session.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${Session.instance.user?.email}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemSelected: (index) {
          log('index: $index');
        },
      ),
    );
  }
}
