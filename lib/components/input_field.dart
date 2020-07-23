import 'package:day_night_login/utils/viewport_size.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ViewportSize.width * 0.85,
      alignment: Alignment.center,
      child: Theme(
        data: ThemeData(
          primaryColor: const Color(0x55000000),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ViewportSize.width * 0.025),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFFFFFFFF),
            ),
            fillColor: const Color(0x33000000),
            filled: true,
          ),
        ),
      ),
    );
  }
}
