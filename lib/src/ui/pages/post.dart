import 'package:flutter/material.dart';
import 'package:post/src/utils/session.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'Post: ${Session.instance.user!.email}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
