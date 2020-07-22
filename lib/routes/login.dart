import 'package:day_night_login/components/day/sun.dart';
import 'package:day_night_login/components/day/sun_rays.dart';
import 'package:day_night_login/components/night/moon.dart';
import 'package:day_night_login/components/night/moon_rays.dart';
import 'package:day_night_login/components/toggle_button.dart';
import 'package:day_night_login/models/login_theme.dart';
import 'package:day_night_login/utils/cached_images.dart';
import 'package:day_night_login/utils/custom_icons_icons.dart';
import 'package:day_night_login/utils/viewport_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  LoginTheme day;
  LoginTheme night;
  Mode _activeMode = Mode.day;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..forward();
    initializeTheme(); //initializing theme for day and night
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    compute(cacheImages, context);
  }

  initializeTheme() {
    day = LoginTheme(
      title: 'Good Morning,',
      backgroundGradient: [
        const Color(0xFF8C2480),
        const Color(0xFFCE587D),
        const Color(0xFFFF9485),
        const Color(0xFFFF9D80),
        // const Color(0xFFFFBD73),
      ],
      landscape: 'assets/images/day.png',
      circle: Sun(
        controller: _animationController,
      ),
      rays: SunRays(
        controller: _animationController,
      ),
    );

    night = LoginTheme(
      title: 'Good Night,',
      backgroundGradient: [
        const Color(0xFF0D1441),
        const Color(0xFF283584),
        const Color(0xFF6384B2),
        //const Color(0xFF6486B7),
      ],
      landscape: 'assets/images/night.png',
      circle: Moon(
        controller: _animationController,
      ),
      rays: MoonRays(
        controller: _animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ViewportSize.getSize(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _activeMode == Mode.day
                ? day.backgroundGradient
                : night.backgroundGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              width: height * 0.8,
              height: height * 0.8,
              bottom: _activeMode == Mode.day ? -300 : -50,
              child: _activeMode == Mode.day ? day.rays : night.rays,
            ),
            Positioned(
              bottom: -160,
              child: _activeMode == Mode.day ? day.circle : night.circle,
            ),
            Positioned.fill(
              child: Image.asset(
                _activeMode == Mode.day ? day.landscape : night.landscape,
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
                    tapCallback: (index) {
                      setState(() {
                        _activeMode = index == 0 ? Mode.day : Mode.night;
                        _animationController.forward(from: 0.0);
                      });
                    },
                  ),
                  buildText(
                    text: _activeMode == Mode.day ? day.title : night.title,
                    padding: EdgeInsets.only(top: height * 0.04),
                    fontSize: width * 0.09,
                    fontFamily: 'YesevaOne',
                  ),
                  buildText(
                    fontSize: width * 0.04,
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                    ),
                    text: 'Enter your informations below',
                  ),
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
                  Container(
                    width: width - width * 0.15,
                    margin: EdgeInsets.only(top: height * 0.02),
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: width * 0.155,
                      height: width * 0.155,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color(0xFFFFFFFF),
                        shadows: [
                          BoxShadow(
                            color: const Color(0x55000000),
                            blurRadius: width * 0.02,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Icon(CustomIcons.right_arrow),
                    ),
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

enum Mode {
  day,
  night,
}

cacheImages(context) {
  CachedImages.imageAssets.forEach((asset) {
    precacheImage(asset, context);
  });
}
