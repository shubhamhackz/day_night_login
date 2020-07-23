import 'package:day_night_login/components/gradient_circle.dart';
import 'package:day_night_login/utils/viewport_size.dart';
import 'package:flutter/widgets.dart';

class Moon extends AnimatedWidget {
  Moon({@required this.controller}) : super(listenable: controller);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: controller
          .drive(
            Tween<Offset>(
              begin: Offset(0, 0),
              end: Offset(0, -110),
            ).chain(
              CurveTween(curve: Curves.easeInOut),
            ),
          )
          .value,
      child: GradientCircle(
        width: ViewportSize.width * 0.67,
        stops: [
          0.8,
          1,
        ],
        child: GradientCircle(
          width: ViewportSize.width * 0.54,
          stops: [
            0.75,
            1,
          ],
          child: GradientCircle(
            width: ViewportSize.width * 0.42,
            stops: [
              0.7,
              1,
            ],
            child: Image.asset(
              'assets/images/moon.png',
            ),
          ),
        ),
      ),
    );
  }
}
