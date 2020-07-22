import 'package:day_night_login/utils/viewport_size.dart';
import 'package:flutter/widgets.dart';

class SunRays extends AnimatedWidget {
  SunRays({this.controller}) : super(listenable: controller);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: controller
          .drive(
            Tween<Offset>(
              begin: Offset(0, 0),
              end: Offset(0, -160),
            ),
          )
          .value,
      child: Container(
        width: ViewportSize.width * 1.4,
        height: ViewportSize.width * 1.4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFFf9c87e),
              const Color(0xFFf4aa85),
              const Color(0x00f4aa85),
            ],
            stops: [0.4, 0.7, 1],
          ),
        ),
      ),
    );
  }
}
