import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit_converter/responsive/dimensions.dart';
import 'package:unit_converter/routes/page_routes.dart';

import 'MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Timer(const Duration(milliseconds: 3990 ), () {
      Navigator.pushReplacement(
          context, RouteGenerator.createRoute(const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.updateDimensions(context, 'w', 20)),
                  child: Container(
                    height: Dimensions.updateDimensions(context, 'h', 200),
                    width: Dimensions.updateDimensions(context, 'w', 200),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/splash_screen_logo.png'),
                        fit: BoxFit.contain,

                      ),
                    ),
                  ),
                ),
                 SizedBox(height: Dimensions.updateDimensions(context, 'h', 30)),
                RichText(
                  text:  TextSpan(
                    text: 'Unit Converter',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: Dimensions.updateDimensions(context, 'w', 35),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                 SizedBox(height: Dimensions.updateDimensions(context, 'h', 35)),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      strokeWidth:  Dimensions.updateDimensions(context, 'w', 2),
                      color: Colors.blueGrey,
                      value: _controller.value,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
