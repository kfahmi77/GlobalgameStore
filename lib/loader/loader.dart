import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:globalgamestore/Screens/Login/login_screen.dart';
import 'package:globalgamestore/navigation/navigation.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final  User? user = FirebaseAuth.instance.currentUser;

bool isLoggedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}
   return AnimatedSplashScreen(
  splash: Column(
    children: [
      Image.asset('assets/images/logo.png'),
      // const Text('Global', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white))
    ],
  ),
  backgroundColor: Color(0xFFEE4532),
  nextScreen: isLoggedIn() ? NavAppBar() : LoginScreen(), // Ganti LoginPage dengan halaman login yang sesuai
  splashIconSize: 90,
  duration: 4000,
  splashTransition: SplashTransition.fadeTransition,
  pageTransitionType: PageTransitionType.leftToRightWithFade,
  animationDuration: const Duration(seconds: 1),
);
  }
}
