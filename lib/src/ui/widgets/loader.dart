import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:post/src/utils/responsive.dart';

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          width: responsive.wp(25),
          height: responsive.wp(25),
          clipBehavior: Clip.antiAlias,
          child: Lottie.asset("assets/animations/loader.json"),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
        )),
      ),
    );
  }
}

openLoader(BuildContext context) {
  showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) => const _LoadingIndicator(),
      barrierDismissible: false);
}

closeLoader(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
