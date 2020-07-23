import 'package:day_night_login/utils/viewport_size.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String startText;
  final String endText;
  final ValueChanged tapCallback;

  const ToggleButton({
    Key key,
    this.startText,
    this.endText,
    this.tapCallback,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _activeIndex = _activeIndex == 0 ? 1 : 0;
            });
            widget.tapCallback(_activeIndex);
          },
          child: Container(
            width: width * 0.7,
            height: height * 0.06,
            decoration: ShapeDecoration(
              color: const Color(0x33FFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.036),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText(
                  text: widget.startText,
                  color: const Color(0xFFFFFFFF),
                ),
                buildText(
                  text: widget.endText,
                  color: const Color(0xFFFFFFFF),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCirc,
          width: width * 0.7,
          alignment:
              _activeIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            alignment: Alignment.center,
            width: width * 0.35,
            height: height * 0.06,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.036),
              ),
              color: const Color(0xFFFFFFFF),
            ),
            child: buildText(
              text: _activeIndex == 0 ? widget.startText : widget.endText,
            ),
          ),
        ),
      ],
    );
  }

  Text buildText({String text, Color color = const Color(0xFF000000)}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ViewportSize.width * 0.04,
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'Varela',
      ),
    );
  }
}
