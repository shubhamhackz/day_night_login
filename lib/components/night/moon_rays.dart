import 'package:flutter/widgets.dart';

class MoonRays extends AnimatedWidget {
  MoonRays({@required this.controller}) : super(listenable: controller);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller.drive(Tween<double>(begin: 0.00, end: 1.0)),
      child: Transform.translate(
        offset: controller
            .drive(
              Tween<Offset>(
                begin: Offset(0, 0),
                end: Offset(0, -100),
              ),
            )
            .value,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0x666384B2),
                const Color(0x006486B7),
              ],
              stops: [
                0.5,
                1.0,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
