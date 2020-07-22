import 'package:day_night_login/components/day/sun_circle.dart';
import 'package:day_night_login/components/toggle_button.dart';
import 'package:day_night_login/models/login_theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  LoginTheme day = LoginTheme(
      title: 'Good Morning,',
      backgroundGradient: [
        const Color(0xFF8C2480),
        const Color(0xFFCE587D),
        const Color(0xFFFF9485),
        const Color(0xFFFF9D80),
        // const Color(0xFFFFBD73),
      ],
      landscape: 'assets/images/day.png');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF8C2480),
              const Color(0xFFCE587D),
              const Color(0xFFFF9485),
              const Color(0xFFFF9D80),
              // const Color(0xFFFFBD73),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Positioned(
            //   bottom: _animationController
            //       .drive(Tween<double>(begin: -300, end: -120))
            //       .value,
            //   child: Container(
            //     width: width * 1.4,
            //     height: width * 1.4,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       gradient: RadialGradient(
            //         colors: [
            //           const Color(0xFFf9c87e),
            //           const Color(0xFFf4aa85),
            //           const Color(0x00f4aa85),
            //         ],
            //         stops: [0.4, 0.7, 1],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: _animationController
                  .drive(Tween<double>(begin: -160, end: -80))
                  .value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SunCircle(
                    width: width * 0.9,
                    stops: [
                      0.88,
                      1,
                    ],
                    child: SunCircle(
                      width: width * 0.7,
                      stops: [0.8, 1],
                      child: SunCircle(
                        width: width * 0.5,
                        stops: [0.6, 1],
                        child: Container(
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFFfad9a5),
                          const Color(0x00fad9a5),
                        ],
                        stops: [0.3, 1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                'assets/images/day.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: height * 0.1,
              left: width * 0.07,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToggleButton(
                    startText: 'Morning Login',
                    endText: 'Night Login',
                    tapCallback: (index) {},
                  ),
                  buildText(
                      text: 'Good Morning,',
                      padding: EdgeInsets.only(top: height * 0.04),
                      fontSize: width * 0.09,
                      fontFamily: 'YesevaOne'),
                  buildText(
                      fontSize: width * 0.04,
                      padding: EdgeInsets.only(
                        top: height * 0.02,
                      ),
                      text: 'Enter your informations below'),
                  buildText(
                    text: 'Email Address',
                    padding: EdgeInsets.only(
                        top: height * 0.04, bottom: height * 0.015),
                    fontSize: width * 0.04,
                  ),
                  buildInputFiled(
                    hintText: 'Enter your email',
                    width: width,
                  ),
                  buildText(
                    text: 'Password',
                    padding: EdgeInsets.only(
                      top: height * 0.03,
                      bottom: height * 0.015,
                    ),
                    fontSize: width * 0.04,
                  ),
                  buildInputFiled(
                    hintText: 'Your password',
                    width: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildInputFiled({double width, String hintText}) {
    return Container(
      width: width * 0.85,
      alignment: Alignment.center,
      child: Theme(
        data: ThemeData(
          primaryColor: const Color(0x55000000),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.025),
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

  Padding buildText(
      {double fontSize, EdgeInsets padding, String text, String fontFamily}) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFFFFFFFF),
          fontSize: fontSize,
          fontFamily: fontFamily ?? '',
        ),
      ),
    );
  }
}
