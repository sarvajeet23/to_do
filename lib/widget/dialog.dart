import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShibooDialog {
  static showDialogCupertino({
    required BuildContext context,
    required String title,
    Widget? content,
    required List<Widget> actions,
  }) async =>
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(title),
                content: content,
                actions: List.generate(actions.length, (index) => actions[index]),
              ));

  static void kDialogBox({
    Widget? icon,
    Widget? title,
    Widget? content,
    Color? shadowColor,
    Color? backgroundColor,
    ShapeBorder? shape,
    MainAxisAlignment? actionsAlignment,
    AlignmentGeometry? alignment,
    required BuildContext context,
    required List<Widget> actions,
  }) =>
      showDialog(
          useSafeArea: true,
          context: context,
          builder: (BuildContext conttext) => AlertDialog(
                alignment: alignment,
                shape: shape,
                content: content,
                icon: icon,
                shadowColor: shadowColor,
                actionsAlignment: actionsAlignment,
                title: title,
                backgroundColor: backgroundColor,
                actions: List.generate(actions.length, (index) => actions[index]),
              ));

  static void snackBar(
          {required BuildContext context,
          required Widget leading,
          required Duration duration,
          Color? backgroundColor,
          SnackBarAction? trailing,
          ShapeBorder? shape}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          duration: duration,
          content: leading,
          action: trailing,
          shape: shape,
        ),
      );

  static messageLongPress({
    required String message,
    required Duration timeDuration,
    required Widget child,
    double? height,
    InlineSpan? richMessage,
    TextAlign? textAlign,
    Decoration? decoration,
    TextStyle? textStyle,
  }) =>
      Tooltip(
        decoration: decoration,
        richMessage: richMessage,
        message: message,
        showDuration: timeDuration,
        textAlign: textAlign,
        height: height,
        textStyle: textStyle,
        child: child,
      );
}
