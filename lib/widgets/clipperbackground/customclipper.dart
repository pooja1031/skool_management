import 'package:flutter/material.dart';

class WaveBackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomWaveClipper(reverse: true),
              child: Container(
                height: MediaQuery.of(context).size.height / 2, 
                color: Colors.blue, 
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  final bool reverse;

  CustomWaveClipper({this.reverse = false});

  @override
  Path getClip(Size size) {
    final path = Path();
    if (reverse) {
      path.lineTo(0, size.height);
      path.quadraticBezierTo(
        size.width / 4, size.height - 50, 
        size.width / 2, size.height - 30);
      path.quadraticBezierTo(
        3 * size.width / 4, size.height, 
        size.width, size.height - 20);
      path.lineTo(size.width, 0);
    } else {
      path.lineTo(0, size.height - 30);
      path.quadraticBezierTo(
        size.width / 4, size.height, 
        size.width / 2, size.height - 30);
      path.quadraticBezierTo(
        3 * size.width / 4, size.height - 60, 
        size.width, size.height);
      path.lineTo(size.width, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

