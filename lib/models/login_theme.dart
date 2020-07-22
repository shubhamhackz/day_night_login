import 'package:flutter/widgets.dart';

class LoginTheme {
  final String title;
  final String landscape;
  final List<Color> backgroundGradient;
  final Widget circle;
  final Widget rays;

  LoginTheme(
      {this.circle,
      this.backgroundGradient,
      this.landscape,
      this.title,
      this.rays});
}
