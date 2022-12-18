import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color.fromRGBO(12, 24, 35, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(200.w, 200.h), 100.r, paint1);
  }
 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}