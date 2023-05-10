import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:globalgamestore/navigation/navigation.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  // const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          // const Text('Global', style: TextStyle(fontSize: 40, fontWeight:FontWeight.bold, color: Colors.white))
        ],
      ),
      backgroundColor: Color(0xFFEE4532),
      nextScreen: NavAppBar(),
      splashIconSize: 90,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),

      );
  }
}