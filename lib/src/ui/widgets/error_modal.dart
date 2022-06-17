import 'package:flutter/material.dart';
import 'package:post/src/utils/responsive.dart';

class ErrorModal extends StatelessWidget {
  final String errorText;
  final VoidCallback? onTap;
  final bool? closeWithBackButton;

  const ErrorModal(
      {Key? key, required this.errorText, this.onTap, this.closeWithBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return WillPopScope(
      onWillPop: () async {
        return closeWithBackButton ?? true;
      },
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          width: responsive.wp(75),
          height: responsive.hp(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Center(
            child: LayoutBuilder(builder: (context, c) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                      child: Text(
                        errorText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.dp(1.7)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap ??
                        () {
                          Navigator.pop(context);
                        },
                    child: Container(
                      width: c.maxWidth,
                      height: responsive.hp(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Center(
                          child: Text("Aceptar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: responsive.dp(1.6),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              );
            }),
          ),
        )),
      ),
    );
  }
}

void openError(context, String errorText, {VoidCallback? onTap}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => ErrorModal(
          errorText: errorText,
          onTap: onTap ??
              () {
                Navigator.of(context, rootNavigator: true).pop();
              }));
}

void closeError(context) {
  Navigator.of(context, rootNavigator: true).pop();
}
