import 'package:flutter/material.dart';
import 'package:textfield_validation_bloc/ui/styles/palette.dart';

enum LinearStrokeCap { butt, round }

class CustomProgressbarLinear extends StatelessWidget {
  final double progress;
  final double width;
  final double lineHeight;

  final Color backgroundColor;
  final Color progressbarColor;

  final Widget center;
  final LinearStrokeCap linearStrokeCap;

  final EdgeInsets padding;

  CustomProgressbarLinear({
    Key key,
    this.progress = 0.0,
    this.lineHeight = 5.0,
    this.width,
    this.backgroundColor = Palette.black,
    this.progressbarColor = Palette.dimGreenText,
    this.center = const SizedBox(),
    this.padding = EdgeInsets.zero,
    this.linearStrokeCap,
  }) : super(key: key) {
    if (progress < 0.0 || progress > 1.0) {
      throw Exception('Percent value must be a double between 0.0 and 1.0');
    }
  }
  @override
  Widget build(BuildContext context) {
    final containerWidget = Container(
      width: width ?? double.infinity,
      height: lineHeight,
      padding: padding,
      child: CustomPaint(
        painter: LinearPainter(
          linearStrokeCap: linearStrokeCap,
          progress: progress,
          progressColor: progressbarColor,
          backgroundColor: backgroundColor,
          lineWidth: lineHeight,
        ),
        child: Center(child: center),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          width != null
              ? containerWidget
              : Expanded(
                  child: containerWidget,
                )
        ],
      ),
    );
  }
}

class LinearPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintLine;
  final double lineWidth;
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final LinearStrokeCap linearStrokeCap;

  LinearPainter({
    this.lineWidth,
    this.progress,
    this.progressColor,
    this.backgroundColor,
    this.linearStrokeCap = LinearStrokeCap.butt,
  }) {
    _paintBackground = Paint()
      ..color = backgroundColor
      ..strokeWidth = lineWidth;

    _paintLine = Paint()
      ..color = progress == 0.0 ? progressColor.withOpacity(0.0) : progressColor
      ..strokeWidth = lineWidth;

    _paintLine.strokeCap = (linearStrokeCap == LinearStrokeCap.butt)
        ? StrokeCap.butt
        : StrokeCap.round;
    _paintBackground.strokeCap = (linearStrokeCap == LinearStrokeCap.butt)
        ? StrokeCap.butt
        : StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2.0);
    final end = Offset(size.width, size.height / 2.0);
    final xProgress = size.width * progress;

    _drawDashedLine(canvas, size, _paintBackground, _paintLine);
    // canvas.drawLine(start, end, _paintBackground);

    // canvas.drawLine(start, Offset(xProgress, size.height / 2.0), _paintLine);
    //     _drawDashedLine(canvas, paint, size);
    const int dashWidth = 34;
    const int dashSpace = 14;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = 10;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    // while (startX < size.width) {
    //   // Draw a small line.
    //   // canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
    //   canvas.drawLine(
    //       Offset(startX, y), Offset(startX + dashWidth, y), _paintBackground);

    //   // Update the starting X
    //   // startX += dashWidth + dashSpace;
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawDashedLine(
      Canvas canvas, Size size, Paint paintBackground, Paint paintLine) {
    const int dashWidth = 34;
    const int dashSpace = 14;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double startX2 = 0;

    double y = 10;
    // double progress = 10.0;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startX < size.width) {
      print('ajjajs' + size.width.toString());
      // Draw a small line.
      canvas.drawLine(Offset(startX, size.height / 2.0),
          Offset(startX + dashWidth, size.height / 2.0), paintBackground);

      // canvas.drawLine(Offset(startX, size.height / 2.0),
      // Offset(0.3, size.height / 2.0), paintLine);
      // _drawDashedLine(canvas, paint, size);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
    while (startX2 < size.width * progress) {
      print('asna' + progress.toString());
      print('sanasjknas');
      canvas.drawLine(Offset(startX2, size.height / 2.0),
          Offset(startX2 + dashWidth, size.height / 2.0), paintLine);
      startX2 += dashWidth + dashSpace;
    }
  }
}
