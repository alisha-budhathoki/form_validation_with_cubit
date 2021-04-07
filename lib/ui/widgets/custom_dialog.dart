import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final String firstActionValue;
  final String secondActionValue;
  final Function() firstActionPressed;
  final Function() secondActionPressed;

  const CustomDialog({
    Key key,
    @required this.title,
    this.content,
    this.firstActionValue = '',
    this.secondActionValue = '',
    this.firstActionPressed,
    this.secondActionPressed,
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        // style: TextStyles.headline4.semiBold.withColor(Palette.darkGreenText),
      ),
      content: content,
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            firstActionPressed();
          },
          child: Text(
            firstActionValue,
            // style: TextStyles.bodyText1.withColor(Palette.primary).semiBold,
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            secondActionPressed();
          },
          child: Text(
            secondActionValue,
            // style: TextStyles.bodyText1.withColor(Palette.primary).semiBold,
          ),
        ),
      ],
    );
  }
}
