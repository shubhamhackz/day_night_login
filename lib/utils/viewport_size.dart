import 'package:flutter/widgets.dart';

class ViewportSize {
  static double height;
  static double width;

  static getSize(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
