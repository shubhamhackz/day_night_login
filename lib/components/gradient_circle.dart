import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  const GradientCircle({Key key, @required this.width, this.child, this.stops})
      : super(key: key);

  final double width;
  final Widget child;
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0x00FFFFFF),
            const Color(0x44FFFFFF),
          ],
          stops: stops,
        ),
      ),
      child: child,
    );
  }
}
