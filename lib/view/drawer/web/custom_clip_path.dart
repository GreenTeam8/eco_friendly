import 'package:flutter/material.dart';

/// Clip widget in oval shape at top side
class CustomClipPathWeb extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height=size.height;
    double width=size.width;
    final path = Path();
    path.lineTo(0, height);
    path.lineTo( width*0.45,height);
    path.lineTo(width,0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
