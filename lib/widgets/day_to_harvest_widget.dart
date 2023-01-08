import 'dart:math';
import 'package:flutter/material.dart';

class ControlWidget extends StatefulWidget {
  const ControlWidget({Key? key}) : super(key: key);

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: const DayToHarvestWidget(
          ratio: 0.72,
          fillColor: Color.fromARGB(255, 24, 133, 91),
          lineColor: Colors.red,
          freeColor: Colors.yellow,
          lineWidth: 5,
          child: Text(
            '35 днів',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DayToHarvestWidget extends StatelessWidget {
  final Widget child;

  final double ratio;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const DayToHarvestWidget(
      {Key? key,
      required this.child,
      required this.ratio,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: MyPainter(
          ratio: ratio,
          fillColor: fillColor,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidth: lineWidth
        )),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double ratio;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.ratio,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect){
    final filedPaint = Paint();
        filedPaint.color = lineColor;
        filedPaint.style = PaintingStyle.stroke;
        filedPaint.strokeWidth = lineWidth;
        filedPaint.strokeCap = StrokeCap.round;
        canvas.drawArc(
          arcRect,
          -pi / 2,
          pi * 2 * ratio,
          false,
          filedPaint,
        );
  }
    
  void drawFreeArc(Canvas canvas, Rect arcRect){
    final freePaint = Paint();
      freePaint.color = freeColor;
      freePaint.style = PaintingStyle.stroke;
      freePaint.strokeWidth = lineWidth;
      
      canvas.drawArc(
        arcRect,
        pi * 2 * ratio - (pi / 2),
        pi * 2 * (1.0 - ratio),
        false,
        freePaint,
      );
  }
    
  void drawBackground(Canvas canvas, Size size){
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size){
    final linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
      Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
