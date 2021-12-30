import 'package:flutter/material.dart';

class CustomRectangle extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.12, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.88, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.red;
    Path path = Path();
//    uncomment this and will get the border for all lines
    path.moveTo(size.width * 0.12, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.88, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
